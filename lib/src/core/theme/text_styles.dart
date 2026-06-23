import 'package:flutter/material.dart';
import 'package:uiren/gen/fonts.gen.dart';
import 'package:uiren/src/core/colors/colors.dart';

class TextStyles {
  static TextStyle regular(Color? color, {double? fontSize}) => TextStyle(
    fontFamily: FontFamily.manrope,
    fontFamilyFallback: ['Roboto'],
    fontSize: fontSize ?? 13,
    fontWeight: FontWeight.normal,
    color: color ?? AppColors.black,
  );
  static TextStyle medium(Color? color, {double? fontSize}) => TextStyle(
    fontFamily: FontFamily.manrope,
    fontFamilyFallback: ['Roboto'],
    fontSize: fontSize ?? 16,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.black,
  );
  static TextStyle semibold(Color? color, {double? fontSize}) => TextStyle(
    fontFamily: FontFamily.manrope,
    fontFamilyFallback: ['Roboto'],
    fontSize: fontSize ?? 16,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.black,
  );
  static TextStyle bold(Color? color, {double? fontSize}) => TextStyle(
    fontFamily: FontFamily.manrope,
    fontFamilyFallback: ['Roboto'],
    fontSize: fontSize ?? 22,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.black,
  );
}