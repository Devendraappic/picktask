// new color for picktask project

import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF000018); // background color for all screens
const kWhiteColor = Colors.white; // white color for all screens
const kPrimaryColor = Color(0xFF25232E); // primary color of app
const kBalckColor = Colors.black; // balck color
const kBlueColor = Color(0xff523DE9);  // blue primary color


final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.yellow, Colors.yellow.shade900],
).createShader(Rect.fromLTRB(0, 20, 200, 200));

