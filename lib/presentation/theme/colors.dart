import 'package:flutter/material.dart';

class AppColors{
  static const MaterialColor primary = MaterialColor(
    0xffF7D358,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffe6c845), //10%
      100: Color(0xffd6b12c), //20%
      200: Color(0xffc69f13), //30%
      300: Color(0xffb68d00), //40%
      400: Color(0xffa67b00), //50%
      500: Color(0xff956900), //60%
      600: Color(0xffc1903d), //70%
      700: Color(0xffa97e35), //80%
      800: Color(0xff916c2e), //90%
      900: Color(0xff795a26), //100%
    },
  );
}