import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_config_buttons_layout.dart';
import 'device_list_buttons.dart';

class ControlBarLayout extends StatelessWidget {
  const ControlBarLayout({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8
      ),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
      ),
      child: child,
    );
  }
}
