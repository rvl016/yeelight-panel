import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/common/framed.dart';


class SecondaryPanelLayout extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SecondaryPanelLayout({
    super.key, 
    required this.title, 
    required this.children, 
  });

  @override
  Widget build(BuildContext context) {

    final colors = Get.theme.colorScheme;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16
          ),
          decoration: BoxDecoration(
            color: colors.onTertiaryContainer,
            border: Border(
              bottom: BorderSide(
                color: colors.onSecondaryContainer,
                width: 2,
              ),
            )
          ),
          child: Text(title, style: Get.textTheme.labelLarge),
        ),
        ...children
      ]
    );
  }
}