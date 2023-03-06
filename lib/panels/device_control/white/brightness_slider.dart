import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/common/ct_color.dart';

class BrightnessSlider extends StatelessWidget {
  const BrightnessSlider({super.key, required this.brightness});

  final RxInt brightness;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: Obx(() => SliderTheme(
        data: SliderThemeData(
          trackShape: GradientRectSliderTrackShape(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.white],
            ),
          ),
          trackHeight: 32,
          thumbColor: CTColor(brightness.value),
          inactiveTrackColor: Colors.white10,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 18.0),
          overlayColor: Colors.red.withAlpha(0),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
          activeTickMarkColor: Colors.red[700],
          inactiveTickMarkColor: Colors.red[100],
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: Colors.black,
          valueIndicatorTextStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        child: Slider(
          min: 0,
          max: 255,
          label: '${brightness.value}',
          value: brightness.value.toDouble(),
          onChanged: (value) => brightness.value = value.toInt(),
        ),
      ),
    ));
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