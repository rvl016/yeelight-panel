

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorChip extends StatelessWidget {

  final Rx<Color> color;

  const ColorChip(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Material(
      shape: const CircleBorder(),
      color: color.value,
      surfaceTintColor: Colors.black12,
    ));
  }
}

