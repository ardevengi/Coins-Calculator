import 'package:faka_calc/assets/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum _MenuBtns {
  forMe,
  forYou,
  reset,
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyMainPage(),
    );
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  late TextEditingController controller;
  var v;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  var _forMe = 0.0;
  var _forYou = 0.0;
  var _target = 0.0;

  List<String> buttons = [
    "+0.25",
    "+0.5",
    "+1",
    "+2",
    "+3",
    "-0.25",
    "-0.5",
    "-1",
    "-2",
    "-3"
  ];

  checkColor(index) {
    if (index < 5) {
      return forMeColor;
    }
    return forYouColor;
  }

  calc() {
    _target = _forMe - _forYou;
  }

  add(value) {
    if (value > 0) {
      _forMe += value;
    } else {
      _forYou -= value;
    }
    calc();
  }

  reset() {
    _forYou = 0.0;
    _forMe = 0.0;
    _target = 0.0;
  }

  starterForMe() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Starting Value"),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Starting Value"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(controller.text);
              setState(() {
                _forMe = double.parse(controller.text);
                calc();
              });
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  starterForYou() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Starting Value"),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "Starting Value"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(controller.text);
              setState(() {
                _forYou = double.parse(controller.text);
                calc();
              });
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  // List<String> buttons=["0.25","0.5","1","2","3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlue,
      appBar: AppBar(
        backgroundColor: mainDark,
        title: Text("Coin Calculator"),
        actions: [
          PopupMenuButton<_MenuBtns>(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: _MenuBtns.forMe,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "For Me",
                        style: TextStyle(color: forMeColor, fontSize: 18),
                      ),
                      WidgetSpan(
                          child: Icon(
                        Icons.add,
                        color: forMeColor,
                        size: 18,
                      )),
                    ],
                  ),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: _MenuBtns.forYou,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "For You",
                        style: TextStyle(color: forYouColor, fontSize: 18),
                      ),
                      WidgetSpan(
                          child: Icon(
                        Icons.remove,
                        color: forYouColor,
                        size: 18,
                      )),
                    ],
                  ),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                onTap: () {
                  setState(() {
                    reset();
                  });
                },
                value: _MenuBtns.reset,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Reset",
                        style: TextStyle(color: mainDark, fontSize: 18),
                      ),
                      WidgetSpan(
                          child: Icon(
                        Icons.restart_alt,
                        color: mainDark,
                        size: 18,
                      )),
                    ],
                  ),
                ),
              ),
            ],
            onSelected: (value) async {
              switch (value) {
                case _MenuBtns.forMe:
                  controller.clear();
                  await starterForMe();
                  break;
                case _MenuBtns.forYou:
                  controller.clear();
                  await starterForYou();
                  break;
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Total
          Expanded(
            flex: 2,
            child: Center(
              child: RichText(
                  text: TextSpan(style: TextStyle(fontSize: 48), children: [
                TextSpan(
                  text: "$_forMe",
                  style: TextStyle(color: forMeColor),
                ),
                TextSpan(
                  text: "-",
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: "$_forYou",
                  style: TextStyle(color: forYouColor),
                ),
                TextSpan(
                  text: "=",
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: "$_target",
                  style: TextStyle(color: Colors.blue),
                ),
              ])),
            ),
          ),

          //for me
          Divider(
            color: Colors.white,
            thickness: 2,
            height: 20,
          ),

          //for you
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              itemCount: buttons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          add(double.parse(buttons[index]));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: checkColor(index),
                      ),
                      child: FittedBox(
                        child: Text(
                          buttons[index],
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
