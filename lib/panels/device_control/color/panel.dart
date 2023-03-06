import 'package:flutter/material.dart';

import 'brightness_control.dart';
import 'brightness_slider.dart';
import 'color_control.dart';
import 'color_wheel.dart';

class ColorPanel extends StatelessWidget {
  const ColorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: const [
              ColorWheel(),
              BrightnessSlider()
            ],
          ),
          Column(
            children: const [
              ColorControl(),
              BrightnessControl()
            ],
          )
        ]
      ),
    );
  }
}
