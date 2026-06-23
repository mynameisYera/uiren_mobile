// lib/utils/color_utils.dart

import 'dart:math';

import 'package:flutter/material.dart';

Color generateRandomColor() {
  final Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256), // Generating a random number for Red
    random.nextInt(256), // Generating a random number for Green
    random.nextInt(256), // Generating a random number for Blue
    1, // Opaque
  );
}
