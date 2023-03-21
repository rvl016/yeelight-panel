import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';


class ColorWheelPanel extends StatelessWidget {
  const ColorWheelPanel({
    super.key, 
    required this.value, 
    required this.getColor, 
    required this.indicatorMode, 
    required this.title, 
    required this.step, 
    required this.minVal, 
    required this.maxVal, 
    required this.getValueLabel, 
    this.valueUnit = "", 
  });

  final RxDouble value;
  final Color Function(double) getColor;
  final String Function(double) getValueLabel;
  final Rx<IndicatorMode> indicatorMode;
  final String title;
  final RxDouble step;
  final RxDouble minVal;
  final RxDouble maxVal;
  final String valueUnit;

  @override
  Widget build(BuildContext context) {
    const graphsXCenter = 114.0;
    const width = 228.0, height = 278.0;
    const horizontalPadding = 10.0;
    return SizedBox(
      width: width + 20,
      child: SecondaryPanelLayout(
        title: title,
        children: [Listener(
          onPointerSignal: (ev) {
            if (ev is PointerScrollEvent) {
              final scroll = ev.scrollDelta;
              final position = ev.localPosition - const Offset(12, 8);
              if ((position - const Offset(graphsXCenter, 163)).distance <= 50) {
                const trackSize = 80 * 1.5 * math.pi;
                value.value = math.min(
                  maxVal.value, math.max(
                    minVal.value, value.value + ((scroll.dx + scroll.dy) / trackSize / 10) * (maxVal.value - minVal.value)
                  )
                );
              }
              var diff = position - const Offset(graphsXCenter, 32);
              if (diff.dx.abs() <= 20 && diff.dy.abs() <= 6) {
                indicatorMode.value = indicatorMode.value == IndicatorMode.unit ? IndicatorMode.step : IndicatorMode.unit;
              }
              diff = position + const Offset(graphsXCenter, 32);
              if (diff.dx.abs() <= 20 && diff.dy.abs() <= 6) {
                step.value = math.min(
                  maxVal.value - minVal.value, math.max(
                    1, step.value + (scroll.dx + scroll.dy).toInt()
                  )
                );
              }
            }
          },
          child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 4,
            ),
            color: Get.theme.colorScheme.onPrimaryContainer,
            child: CustomPaint(
              size: const Size(width, height),
              painter: TemperatureIndicatorCircle(
                value: value.value, 
                indicatorMode: indicatorMode.value, 
                step: step.value, 
                minVal: minVal.value, 
                maxVal: maxVal.value, 
                getColor: getColor,
                getValueLabel: getValueLabel,
                valueUnit: valueUnit,
              ),
            ),
          )),
        )],
      ),
    );
  }
}

class TemperatureIndicatorCircle extends CustomPainter {

  final double value;
  final Color Function(double) getColor;
  final String Function(double) getValueLabel;
  final String valueUnit;
  final IndicatorMode indicatorMode;
  final double step;
  final double minVal;
  final double maxVal;

  TemperatureIndicatorCircle({
    required this.value, 
    required this.indicatorMode, 
    required this.step, 
    required this.minVal, 
    required this.maxVal, 
    required this.getColor,
    required this.getValueLabel,
    this.valueUnit = ""
  });

  @override
  void paint(Canvas canvas, Size size) {
    const graphsXCenter = 114.0;

    const bgRadius = 115.0, outerRadius = 90.0, radius = 80.0, innerRadius = 60.0;
    const selectorCenter = Offset(graphsXCenter, 163);
    final rectSelectorOuter = (selectorCenter - const Offset(outerRadius, outerRadius)) 
      & const Size(outerRadius * 2, outerRadius * 2);
    final rectSelector = (selectorCenter - const Offset(radius, radius)) & const Size(radius * 2, radius * 2);
    final rectSelectorInner = (selectorCenter - const Offset(innerRadius, innerRadius)) 
      & const Size(innerRadius * 2, innerRadius * 2);
    final backgroundColor = Get.theme.colorScheme.onPrimaryContainer;

    canvas.drawOval(
      (selectorCenter - const Offset(bgRadius, bgRadius)) & const Size(bgRadius * 2, bgRadius * 2), 
      Paint()..color = Get.theme.colorScheme.onBackground
    );
    canvas.drawOval(rectSelectorOuter, Paint()..color = backgroundColor);

    const count = 350;
    final gradientShader = SweepGradient(
      colors: Iterable<int>.generate(count).map((i) => getColor(minVal + (maxVal - minVal) * i / count)).toList(), 
      startAngle: 0, endAngle: 1.5 * math.pi, tileMode: TileMode.decal,
      transform: const GradientRotation(math.pi * 1.75)
    ).createShader(rectSelectorOuter);
    canvas.drawOval(rectSelector, Paint()..shader = gradientShader);
    canvas.drawArc(
      rectSelector, 1.375 * math.pi, .25 * math.pi, true, 
      Paint()..color = Get.theme.colorScheme.primaryContainer..style = PaintingStyle.stroke..strokeWidth = 2
    );
    canvas.drawArc(rectSelector, 1.375 * math.pi, .25 * math.pi, true, Paint()..color = getColor(value));

    paintTickIndicators(canvas, selectorCenter, radius, innerRadius, outerRadius, rectSelectorInner, backgroundColor);
    paintButton(canvas, selectorCenter, radius);

    paintIndicator(graphsXCenter, canvas);
    paintModeControls(canvas, const Offset(graphsXCenter, 32));
  }

  Rect getRect(Offset center, double radius) {
    return (center - Offset(radius, radius)) & Size(radius * 2, radius * 2);
  }

  void paintModeControls(Canvas canvas, Offset indicatorCenter) {
    final colors = Get.theme.colorScheme;
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(
        center: indicatorCenter - const Offset(70, 0), height: 16, width: 40
      ), const Radius.circular(2)), 
      Paint()..color = colors.secondary
    );
    var painter = TextPainter(
      text: TextSpan(
        text: indicatorMode.toText, 
        style: TextStyle(color: colors.onTertiary.withAlpha(190), fontWeight: FontWeight.bold)
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout(maxWidth: 40);
    painter.paint(canvas, indicatorCenter - Offset(70 + painter.width / 2, painter.height / 2));

    if (indicatorMode == IndicatorMode.unit) {
      return;
    }
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(
        center: indicatorCenter + const Offset(70, 0), height: 16, width: 40
      ), const Radius.circular(2)), 
      Paint()..color = colors.secondary
    );
    painter = TextPainter(
      text: TextSpan(
        text: step.toString(), 
        style: TextStyle(color: colors.onTertiary.withAlpha(190), fontWeight: FontWeight.bold)
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout(maxWidth: 40);
    painter.paint(canvas, indicatorCenter - Offset(- 70 + painter.width / 2, painter.height / 2));
  }

  void paintButton(Canvas canvas, Offset selectorCenter, double radius) {
    canvas.save();
    canvas.translate(selectorCenter.dx, selectorCenter.dy);
    canvas.rotate(math.pi * 1.5 * (value - minVal) / (maxVal - minVal) - .25 * math.pi);
    const selectorWheelRadius = 50.0;
    final indicator = Path()
      ..moveTo(0, 20)
      ..lineTo(radius - 6, 0)
      ..lineTo(0, - 20)
      ..lineTo(0, 0)
      ..lineTo(radius - 6, 0)
      ..lineTo(0, 0)
      ..lineTo(0, 20);

    final buttonColor = Get.theme.colorScheme.onTertiaryContainer;
    final borderColor = Get.theme.colorScheme.onTertiary;
    canvas.drawPath(indicator, Paint()..color = buttonColor..style = PaintingStyle.fill);
    canvas.drawPath(indicator, Paint()..color = borderColor..style = PaintingStyle.stroke);
    final rectSelectorWheel = getRect(Offset.zero, selectorWheelRadius);
    canvas.drawOval(rectSelectorWheel, Paint()..color = buttonColor);
    const selectorWheelInnerRadius = selectorWheelRadius - 16;
    canvas.drawOval(
      getRect(Offset.zero, selectorWheelInnerRadius), 
      Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 4
    );
    canvas.drawOval(
      getRect(Offset.zero, selectorWheelRadius), 
      Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 1
    );
    Iterable<int>.generate(10).map((i) => canvas.drawCircle(
      Offset.zero, selectorWheelInnerRadius * i / 11, 
      Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 1
    )).toSet();
    Iterable<int>.generate(100).map((i) {
      final a = 2 * math.pi * i / 100;
      canvas.drawLine(
        Offset.fromDirection(a, selectorWheelInnerRadius), 
        Offset.fromDirection(a, selectorWheelRadius), 
        Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = 1
      );
    }).toSet();
    canvas.restore();
  }

  void paintIndicator(double graphsXCenter, ui.Canvas canvas) {
    const bgRadius = 32.0;
    final indicatorCenter = Offset(graphsXCenter, 32);
    final rectIndicator = getRect(indicatorCenter, 24);
    canvas.drawOval(
      (indicatorCenter - const Offset(bgRadius, bgRadius)) & const Size(bgRadius * 2, bgRadius * 2), 
      Paint()..color = Get.theme.colorScheme.onBackground
    );
    if (indicatorMode == IndicatorMode.step) {
      final paintIndcatorCur = Paint()..color = getColor(value);
      canvas.drawArc(rectIndicator, .25 * math.pi, .75 * math.pi, true, paintIndcatorCur);
      canvas.drawArc(rectIndicator, 1.25 * math.pi, 1.75 * math.pi, true, paintIndcatorCur);
    
      final paintIndcatorNext = Paint()..color = getColor(value + step);
      canvas.drawArc(rectIndicator, 1.75 * math.pi, .25 * math.pi, true, paintIndcatorNext);
    
      final paintIndcatorPrevious = Paint()..color = getColor(value - step);
      canvas.drawArc(rectIndicator, .75 * math.pi, 1.25 * math.pi, true, paintIndcatorPrevious);
    } else {
      final step = (maxVal - minVal) * .15;
      const count = 20;
      canvas.drawOval(rectIndicator, Paint()..shader = LinearGradient(
        colors: Iterable.generate(count + 1).map((i) => getColor(value + (i - count / 2) * step / count)).toList()
      ).createShader(rectIndicator));
    }

    final painter = TextPainter(
      text: TextSpan(
        text: "${getValueLabel(value)}$valueUnit", 
        style: TextStyle(color: Get.theme.colorScheme.onTertiary.withAlpha(190), fontWeight: FontWeight.bold)
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout(maxWidth: 100);
    painter.paint(canvas, indicatorCenter - Offset(painter.width / 2, painter.height / 2));
  }

  void paintTickIndicators(
    Canvas canvas, Offset selectorCenter, double radius, double innerRadius, 
    double outerRadius, Rect rectSelectorInner, Color backgroundColor
  ) {
    const ticks = 48;
    Iterable<int>.generate(ticks + 1).map((i) {
      final angle = math.pi * (-.25 + i / ticks * 1.5);
      paintTick(canvas, selectorCenter, angle, radius, innerRadius, i, outerRadius);
      if (i % 2 == 0) {
        paintTickIndicator(canvas, i, ticks, selectorCenter, angle, outerRadius);
      }
    }).toSet();
    canvas.drawOval(rectSelectorInner, Paint()..color = backgroundColor);
  }

  void paintTick(Canvas canvas, Offset selectorCenter, double angle, double radius, double innerRadius, int i, double outerRadius) {
    canvas.drawLine(
      selectorCenter + Offset.fromDirection(
        angle, radius - innerRadius * (i % 2 == 0 ? 1 / 12 : 1 / 18)
      ), 
      selectorCenter + Offset.fromDirection(angle, outerRadius), 
      Paint()..color = Get.theme.colorScheme.primaryContainer..strokeWidth = (i % 2 == 0 ? 1.5 : 1)
    );
  }

  void paintTickIndicator(
    ui.Canvas canvas, int i, int ticks, Offset selectorCenter, double angle, double outerRadius
  ) {
    canvas.save();
    final curVal = minVal + (maxVal - minVal) * i / ticks;
    final painter = TextPainter(
      text: TextSpan(
        text: getValueLabel(curVal), 
        style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 8, 
          color: getColor(curVal),
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: 100);
    final isPastHalf = i > ticks / 2;
    final isHalf = i == ticks / 2;
    final initialPosition = Offset(
      isPastHalf ? - painter.width : (isHalf ? - painter.width / 2 : 0), - painter.height / 2
    );
    final position = selectorCenter + Offset.fromDirection(angle, outerRadius * 1.04);
    canvas.translate(position.dx, position.dy);
    canvas.rotate(
      (isHalf ? 0 : 1) * angle + (isHalf ? 0 : 1) * ((isPastHalf ? math.pi : 0) 
      + (isPastHalf ? 1 : isHalf ? 0 : -1) * .2 * math.pi * math.sin(angle))
    );
    painter.paint(canvas, initialPosition);
    canvas.restore();
  }
  
  @override
  bool shouldRepaint(covariant TemperatureIndicatorCircle oldDelegate) {
    return (
      oldDelegate.indicatorMode != indicatorMode 
      || oldDelegate.value != value
      || oldDelegate.step != step
    );
  }
}

//class Temperature

enum IndicatorMode {
  step,
  unit
}

extension ToDisplayIndicatorMode on IndicatorMode {
  String get toText {
    const typeToString = {
      IndicatorMode.unit: "Unit",
      IndicatorMode.step: "Step",
    };
    return typeToString[this]!;
  }
}