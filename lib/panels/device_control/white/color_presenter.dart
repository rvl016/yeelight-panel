import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';
import 'package:yeelight_panel/widgets/common/color_chip.dart';

class ColorPresenter extends StatelessWidget {
  final Rx<Color> color;

  const ColorPresenter({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryPanelLayout(
      title: "Current Color",
      child: ColorChip(color),
    );
  }
}


