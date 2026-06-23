import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = Color(0xff3399FF);
  static const Color sunYellow = Color(0xffFFD633);
  static const Color secondaryColor = Color(0xff1A365D);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color red = Color(0xffFF4D4D);
  static const Color grey = Color(0xff808080);




  static LinearGradient mainGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.mainColor,
      const Color.fromARGB(255, 46, 92, 157),
    ],
    stops: [0.05, 1.0],
  );
}
