import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:indexed/indexed.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';
import 'package:yeelight_panel/widgets/common/color_chip.dart';

class ColorPresenter extends StatelessWidget {
  final Rx<Color> color;
  final Widget? child;

  const ColorPresenter({Key? key, required this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: SecondaryPanelLayout(
        title: "Current Color",
        children: [
          ColorChip(color),
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}

class StateFieldsWhiteData extends StatelessWidget {
  const StateFieldsWhiteData({
    super.key,
    required this.brightness,
    required this.temperature,
  });

  final RxDouble brightness;
  final RxDouble temperature;

  @override
  Widget build(BuildContext context) {
    final colors = Get.theme.colorScheme;
    return Indexed(
      index: -100,
      child: Container(
        padding: const EdgeInsets.only(
          top: 8
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colors.onTertiaryContainer,
              width: 1
            )
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.black38,
            ),
            BoxShadow(
              color: colors.onPrimaryContainer,
              spreadRadius: -3.0,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyledValueDisplay(
              label: "Brightness", 
              value: "${(100 * brightness.value).toInt()}", 
              unit: "%",
              width: 80,
              position: Position.left,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: colors.onTertiaryContainer
                  ),
                )
              ),
              child: StyledValueDisplay(
                label: "Temperature", 
                value: "${temperature.value.toInt()}", 
                unit: "K",
                width: 80,
                position: Position.center,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

enum Position {
  left,
  center,
  right,
}

class StyledValueDisplay extends StatelessWidget {
  const StyledValueDisplay({
    super.key,
    required this.label,
    required this.value, 
    this.unit = "", 
    required this.position,
    required this.width,
  });


  final String unit;
  final String value;
  final String label;
  final Position position;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.onTertiaryContainer,
              borderRadius: BorderRadius.only(
                topRight: position == Position.left ? const Radius.elliptical(6, 4) : Radius.zero,
                topLeft: position == Position.right ? const Radius.elliptical(6, 4) : Radius.zero,
              )
            ),
            padding: position == Position.left 
                ? const EdgeInsets.only(bottom: 2, top: 1, right: 10, left: 4)
              : position == Position.right
                ? const EdgeInsets.only(bottom: 2, top: 1, right: 4, left: 10)
                : const EdgeInsets.only(bottom: 2, top: 1, right: 4, left: 4),
            child: Text(
              label,
              style: (Get.textTheme.labelSmall ?? const TextStyle()).copyWith(
                overflow: TextOverflow.ellipsis,
                letterSpacing: .25,
                color: Get.theme.colorScheme.primary.withAlpha(220),
                fontSize: 10
              ),
              maxLines: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(1).copyWith(
                    right: 2,
                    top: 3,
                    left: 5,
                  ),
                  color: Get.theme.colorScheme.onPrimaryContainer,
                  child: Text(
                    value,
                    style: (Get.textTheme.labelMedium ?? const TextStyle()).copyWith(
                      color: Get.theme.colorScheme.primary,
                      height: .9,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(1).copyWith(
                  left: 2,
                  top: 3,
                ),
                width: 16,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.onSecondaryContainer.withAlpha(180),
                  border: const Border(
                    left: BorderSide(width: 0),
                  ),
                ),
                child: Text(
                  unit, 
                  style: (Get.textTheme.labelMedium ?? const TextStyle()).copyWith(
                    color: Colors.white70,
                    fontWeight: FontWeight.w100,
                    height: .9,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
