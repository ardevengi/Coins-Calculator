import 'package:faka_calc/assets/color.dart';
import 'package:flutter/material.dart';

final ButtonStyle forMeButtonStyle = ElevatedButton.styleFrom(
  primary: mainGreen,
  elevation: 0,
  minimumSize: const Size(60, 60),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  ),
);
final ButtonStyle forResetButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.blue,
  elevation: 0,
  minimumSize: const Size(60, 60),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  ),
);
final ButtonStyle forYouButtonStyle = ElevatedButton.styleFrom(
  primary: mainRed,
  minimumSize: const Size(60, 60),
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  ),
);
