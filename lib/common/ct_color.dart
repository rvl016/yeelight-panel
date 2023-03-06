import 'dart:math';
import 'package:flutter/material.dart';



class CTColor extends Color {
  CTColor(int colorTemp, {int alpha = 255}) : super(colorTempToRGB(colorTemp.toDouble(), alpha));

  static int colorTempToRGB(double colorTemp, int alpha) {
    final temp = colorTemp / 100;

    final red = temp <= 66
        ? 255
        : (pow(temp - 60, -0.1332047592) * 329.698727446).round().clamp(0, 255);

    final green = temp <= 66
        ? (99.4708025861 * log(temp) - 161.1195681661).round().clamp(0, 255)
        : (pow(temp - 60, -0.0755148492) * 288.1221695283).round().clamp(0, 255);

    final blue = temp >= 66
        ? 255
        : temp <= 19
            ? 0
            : (138.5177312231 * log(temp - 10) - 305.0447927307)
                .round()
                .clamp(0, 255);

    return (
      ((alpha & 0xff) << 24) |
      ((red & 0xff) << 16) |
      ((green & 0xff) << 8)  |
      ((blue & 0xff) << 0)
    ) & 0xFFFFFFFF;
  }

}