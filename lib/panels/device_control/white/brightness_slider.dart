import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/data/app_state.dart';

class BrightnessSlider extends StatelessWidget {
  const BrightnessSlider({super.key, required this.brightness});

  final RxDouble brightness;

  @override
  Widget build(BuildContext context) {
    final panels = context.watch<Rx<ControlPanels>>();
    final colors = Get.theme.colorScheme;

    return Container(
      color: colors.onPrimaryContainer,
      padding: const EdgeInsets.only(
        top: 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (ctx, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: 32,
                child: CustomPaint(
                  painter: SliderTicks(),
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Obx(() {
              final curColorNoBright = HSLColor.fromColor(panels.value.currentColorNoBrightness().value);
              const count = 100;
              return SliderTheme(
                data: SliderThemeData(
                  trackShape: GradientRectSliderTrackShape(
                    gradient: LinearGradient(
                      colors: Iterable<int>.generate(count + 1).map(
                        (i) => curColorNoBright.withAlpha(i / count).toColor()
                      ).toList(),
                    ),
                  ),
                  trackHeight: 24,
                  thumbColor: colors.onTertiaryContainer,
                  inactiveTrackColor: Colors.white10,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 18.0),
                  overlayColor: colors.onTertiaryContainer.withAlpha(64),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
                  valueIndicatorShape: const DropSliderValueIndicatorShape(),
                  valueIndicatorColor: colors.onPrimaryContainer,
                  valueIndicatorTextStyle: Get.textTheme.labelMedium
                ),
                child: Listener(
                  onPointerSignal: (ev) {
                    if (ev is PointerScrollEvent) {
                      final scroll = ev.scrollDelta;
                      brightness.value = max(min(brightness.value - (scroll.dx + scroll.dy) / 5000, 1), 0);
                    }
                  },
                  child: Slider(
                    min: 0,
                    max: 1.0,
                    label: '${(brightness.value * 100).toInt()}',
                    secondaryTrackValue: 1.0,
                    value: brightness.value.toDouble(),
                    onChanged: (value) => brightness.value = min(max(value, 0), 1),
                  ),
                ),
              );
            }),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4
                ),
                decoration: BoxDecoration(
                  color: colors.onTertiaryContainer,
                  borderRadius: const BorderRadius.only(topRight: Radius.elliptical(16, 6)),
                  boxShadow: [
                    BoxShadow(color: colors.onSecondaryContainer, spreadRadius: 2)
                  ]
                ),
                child: const Text("Brightness"),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: colors.onSecondaryContainer,
                        width: 2,
                      )
                    )
                  ),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class GradientRectSliderTrackShape extends SliderTrackShape {
  final LinearGradient gradient;

  const GradientRectSliderTrackShape({required this.gradient});

  @override
  void paint(PaintingContext context, Offset offset, {required RenderBox parentBox, required SliderThemeData sliderTheme, required Animation<double> enableAnimation, required Offset thumbCenter, Offset? secondaryOffset, bool? isEnabled, bool? isDiscrete, required TextDirection textDirection}) {
    final trackRect = getPreferredRect(parentBox: parentBox, offset: offset, sliderTheme: sliderTheme);
    final Paint paint = Paint()..shader = gradient.createShader(trackRect);

    context.canvas.drawRect(trackRect, paint);
  }
  
  @override
  Rect getPreferredRect({
    required RenderBox parentBox, Offset offset = Offset.zero, 
    required SliderThemeData sliderTheme, bool isEnabled = false, bool isDiscrete = false
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    return Rect.fromLTWH(
      offset.dx, offset.dy + (parentBox.size.height - trackHeight) / 2, parentBox.size.width, trackHeight
    );
  }
}


class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
      required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow,
    }
  ) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    );
    tp.layout();
    Offset textCenter = Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}

class SliderTicks extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    const margin = 16.0, tickHeight = 12.0, innerTickHeight = 8.0;
    var curOffset = Offset(margin, size.height - 4);
    canvas.translate(.75, tickHeight);
    const tickColor = Color.fromARGB(255, 42, 42, 42);
    for (var i = 0; i <= 100; i += 5) {
      final isEven = i % 2 == 0 ? 1 : 0;
      canvas.drawLine(
        curOffset, curOffset + Offset(0, - innerTickHeight - (tickHeight - innerTickHeight) * isEven), 
        Paint()..strokeWidth = 1.25 + isEven / 4..color = tickColor
      );
      if (isEven == 1) {
        final painter = TextPainter(
          text: TextSpan(
            text: i.toString(), 
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 10,
              color: Get.theme.colorScheme.secondary
            )
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr
        )..layout(maxWidth: 20);
        painter.paint(canvas, curOffset + Offset(- painter.width / 2, - painter.height - 14));
      }
      curOffset = curOffset.translate((size.width - 2 * margin) / 20, 0);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}