import 'package:flutter/material.dart';

const MaterialColor mycolor = MaterialColor(_mycolorPrimaryValue, <int, Color>{
  50: Color(0xFFFFF4EF),
  100: Color(0xFFFEE5D7),
  200: Color(0xFFFED3BC),
  300: Color(0xFFFEC1A1),
  400: Color(0xFFFDB48C),
  500: Color(_mycolorPrimaryValue),
  600: Color(0xFFFD9F70),
  700: Color(0xFFFC9665),
  800: Color(0xFFFC8C5B),
  900: Color(0xFFFC7C48),
});
const int _mycolorPrimaryValue = 0xFFFDA778;

const MaterialColor mycolorAccent = MaterialColor(_mycolorAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_mycolorAccentValue),
  400: Color(0xFFFFF1EB),
  700: Color(0xFFFFDED2),
});
const int _mycolorAccentValue = 0xFFFFFFFF;