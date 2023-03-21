

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorChip extends StatelessWidget {

  final Rx<Color> color;

  const ColorChip(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Get.theme.colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: colors.onSecondaryContainer,
      child: Obx(() => Column(
        children: [
          CustomPaint(
            size: const Size(56, 56),
            painter: CurrentColor(color.value),
          ),
        ],
      )),
    );
  }
}


class CurrentColor extends CustomPainter {

  final Color color;

  CurrentColor(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    const radius = 24.0;
    const outerRadius = radius + 4;
    canvas.translate(outerRadius, outerRadius);
    canvas.drawCircle(Offset.zero, outerRadius, Paint()..color = Colors.white);
    canvas.drawCircle(Offset.zero, radius, Paint()..color = Colors.black);
    canvas.drawCircle(
      Offset.zero, radius, 
      Paint()..color = Get.theme.colorScheme.onTertiaryContainer..style = PaintingStyle.stroke..strokeWidth = 1
    );
    canvas.drawCircle(Offset.zero, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CurrentColor oldDelegate) {
    return color != oldDelegate.color;
  }

}

