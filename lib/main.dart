import 'package:faka_calc/assets/color.dart';
import 'package:flutter/material.dart';
import 'assets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _forMe = 0.0;
  double _forYou = 0.0;
  double _result = 0.0;
  calc() {
    _result = _forMe + _forYou;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackGround,
      appBar: AppBar(
        title: Text("Faka Calculator"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _forYou = 0;
                  _result = 0;
                  _forMe = 0;
                });
              },
              icon: Icon(Icons.restart_alt)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Result
            Container(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 36),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$_forYou',
                      style: TextStyle(color: mainRed),
                    ),
                    TextSpan(
                      text: '+',
                      style: TextStyle(color: mainSigns),
                    ),
                    TextSpan(
                      text: '$_forMe',
                      style: TextStyle(color: mainGreen),
                    ),
                    TextSpan(
                      text: '=',
                      style: TextStyle(color: mainSigns),
                    ),
                    TextSpan(
                      text: '$_result',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              // child: Text(
              //   '$_forYou+$_forMe=$_result',
              //   style: TextStyle(fontSize: 48),
              // ),
            ),

            //for me
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forMe = _forMe + 0.5;
                        calc();
                      });
                    },
                    style: forMeButtonStyle,
                    child: const Center(
                        child: Text(
                      "+0.5",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forMe = _forMe + 1;
                        calc();
                      });
                    },
                    style: forMeButtonStyle,
                    child: const Center(
                        child: Text(
                      "+1",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forMe = _forMe + 2;
                        calc();
                      });
                    },
                    style: forMeButtonStyle,
                    child: const Center(
                        child: Text(
                      "+2",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forMe = _forMe + 3;
                        calc();
                      });
                    },
                    style: forMeButtonStyle,
                    child: const Center(
                        child: Text(
                      "+3",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),

            //for you
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forYou = _forYou - 0.5;
                        calc();
                      });
                    },
                    style: forYouButtonStyle,
                    child: const Center(
                        child: Text(
                      "-0.5",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forYou = _forYou - 1;
                        calc();
                      });
                    },
                    style: forYouButtonStyle,
                    child: const Center(
                        child: Text(
                      "-1",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forYou = _forYou - 2;
                        calc();
                      });
                    },
                    style: forYouButtonStyle,
                    child: const Center(
                        child: Text(
                      "-2",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _forYou = _forYou - 3;
                        calc();
                      });
                    },
                    style: forYouButtonStyle,
                    child: const Center(
                        child: Text(
                      "-3",
                      style: TextStyle(fontSize: 34, color: Colors.white),
                    )),
                  ),
                ],
              ),
            ),

            //reset

            // Container(
            //   margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         _forYou = 0;
            //         _result = 0;
            //         _forMe = 0;
            //       });
            //     },
            //     style: forResetButtonStyle,
            //     child: Text(
            //       "reset",
            //       style: TextStyle(fontSize: 22),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
