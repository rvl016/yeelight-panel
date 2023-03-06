import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Framed extends StatelessWidget {
  final Widget child;
  final Color? color;
  const Framed({required this.child, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color ?? Get.theme.colorScheme.secondaryContainer, 
          width: 0
        ),
      ),
      child: child,
    );
  }
}