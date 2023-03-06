import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/common/ct_color.dart';
import 'package:yeelight_panel/common/primary_button.dart';
import 'package:yeelight_panel/widgets/device_details.dart';



class TemperatureControl extends StatelessWidget {
  const TemperatureControl({super.key, required this.temperature, required this.indicatorMode, required this.step});
  final RxInt temperature;
  final Rx<IndicatorMode> indicatorMode;
  final RxInt step;

  @override
  Widget build(BuildContext context) {
    return TemperatureSelector(
      temperature: temperature, 
      indicatorMode: indicatorMode, 
      step: step, 
      minTemp: 1700.obs, 
      maxTemp: 6500.obs,
    );
  }
}


class TemperatureSelector extends StatelessWidget {
  TemperatureSelector({
    required this.temperature, 
    required this.indicatorMode, 
    required this.step,
    required this.minTemp,
    required this.maxTemp,
    super.key, 
  });

  final RxInt temperature;
  final Rx<IndicatorMode> indicatorMode;
  final RxInt step;
  final RxInt minTemp;
  final RxInt maxTemp;


  @override
  Widget build(BuildContext context) {
    const width = 228.0, height = 278.0;
    return Column(
      children: [
        Container(
          color: Get.theme.colorScheme.onTertiaryContainer,
          width: width,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10
          ),
          child: Text("Color Temperature", style: Get.textTheme.labelLarge),
        ),
        Listener(
          onPointerSignal: (ev) {
            if (ev is PointerScrollEvent) {
              temperature.value = math.min(
                maxTemp.value, math.max(
                  minTemp.value, temperature.value + (ev.scrollDelta.dx + ev.scrollDelta.dy).toInt()
                )
              );
            }
          },
          child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            color: Get.theme.colorScheme.onPrimaryContainer,
            child: CustomPaint(
              size: const Size(width, height),
              painter: TemperatureIndicatorCircle(
                temperature.value, indicatorMode.value, step.value, minTemp.value, maxTemp.value
              ),
            ),
          )),
        ),
      ],
    );
  }
}

class TemperatureIndicatorCircle extends CustomPainter {

  final int temperature;
  final IndicatorMode indicatorMode;
  final int step;
  final int minTemp;
  final int maxTemp;

  TemperatureIndicatorCircle(this.temperature, this.indicatorMode, this.step, this.minTemp, this.maxTemp);

  @override
  void paint(Canvas canvas, Size size) {
    const graphsXCenter = 114.0;
    paintIndicator(graphsXCenter, canvas);

    const selectorCenter = Offset(graphsXCenter, 163);
    const outerRadius = 90.0, radius = 80.0, innerRadius = 60.0;
    final rectSelectorOuter = (selectorCenter - const Offset(outerRadius, outerRadius)) 
      & const Size(outerRadius * 2, outerRadius * 2);
    final rectSelector = (selectorCenter - const Offset(radius, radius)) & const Size(radius * 2, radius * 2);
    final rectSelectorInner = (selectorCenter - const Offset(innerRadius, innerRadius)) 
      & const Size(innerRadius * 2, innerRadius * 2);
    final backgroundColor = Get.theme.colorScheme.onPrimaryContainer;

    canvas.drawOval(rectSelectorOuter, Paint()..color = backgroundColor);

    final gradientShader = SweepGradient(
      colors: [CTColor(minTemp), CTColor(maxTemp)], 
      startAngle: 0, endAngle: 1.5 * math.pi, tileMode: TileMode.decal,
      transform: const GradientRotation(math.pi * 1.75)
    ).createShader(rectSelectorOuter);
    canvas.drawOval(rectSelector, Paint()..shader = gradientShader);
    canvas.drawArc(rectSelector, 1.375 * math.pi, .25 * math.pi, true, Paint()..color = CTColor(temperature));

    paintTickIndicators(canvas, selectorCenter, radius, innerRadius, outerRadius, rectSelectorInner, backgroundColor);
    paintButton(canvas, selectorCenter, radius);
  }

  ui.Rect getRect(ui.Offset center, double radius) {
    return (center - Offset(radius, radius)) & Size(radius * 2, radius * 2);
  }

  void paintButton(ui.Canvas canvas, ui.Offset selectorCenter, double radius) {
    canvas.save();
    canvas.translate(selectorCenter.dx, selectorCenter.dy);
    canvas.rotate(math.pi * 1.5 * (temperature - minTemp) / (maxTemp - minTemp) - .25 * math.pi);
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
    //canvas.drawOval(getRect(selectorCenter + Offset(2, 2), selectorWheelRadius - 16), Paint()..color = Colors.black45);
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
    final indicatorCenter = Offset(graphsXCenter, 32);
    final rectIndicator = getRect(indicatorCenter, 24);
    if (indicatorMode == IndicatorMode.step) {
      final paintIndcatorCur = Paint()..color = CTColor(temperature);
      canvas.drawArc(rectIndicator, .25 * math.pi, .75 * math.pi, true, paintIndcatorCur);
      canvas.drawArc(rectIndicator, 1.25 * math.pi, 1.75 * math.pi, true, paintIndcatorCur);
    
      final paintIndcatorNext = Paint()..color = Colors.yellow[600]!;
      canvas.drawArc(rectIndicator, 1.75 * math.pi, .25 * math.pi, true, paintIndcatorNext);
    
      final paintIndcatorPrevious = Paint()..color = Colors.yellow[400]!;
      canvas.drawArc(rectIndicator, .75 * math.pi, 1.25 * math.pi, true, paintIndcatorPrevious);
    } else {
      canvas.drawOval(rectIndicator, Paint()..shader = LinearGradient(colors: [
        CTColor(temperature - 200), CTColor(temperature + 200)
      ]).createShader(rectIndicator));
    }

    final painter = TextPainter(
      text: TextSpan(
        text: "${temperature}K", 
        style: TextStyle(color: Get.theme.colorScheme.onTertiary.withAlpha(190), fontWeight: FontWeight.bold)
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr
    )..layout(maxWidth: 100);
    painter.paint(canvas, indicatorCenter - const Offset(20, 8));
  }

  void paintTickIndicators(ui.Canvas canvas, ui.Offset selectorCenter, double radius, double innerRadius, double outerRadius, ui.Rect rectSelectorInner, ui.Color backgroundColor) {
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

  void paintTick(ui.Canvas canvas, ui.Offset selectorCenter, double angle, double radius, double innerRadius, int i, double outerRadius) {
    canvas.drawLine(
      selectorCenter + Offset.fromDirection(
        angle, radius - innerRadius * (i % 2 == 0 ? 1/12 : 1/18)
      ), 
      selectorCenter + Offset.fromDirection(angle, outerRadius), 
      Paint()..color = Get.theme.colorScheme.primaryContainer..strokeWidth = (i % 2 == 0 ? 1.5 : 1)
    );
  }

  void paintTickIndicator(
    ui.Canvas canvas, int i, int ticks, ui.Offset selectorCenter, double angle, double outerRadius
  ) {
    canvas.save();
    final curTemp = (minTemp + (maxTemp - minTemp) * i / ticks).toInt();
    final painter = TextPainter(
      text: TextSpan(
        text: "${curTemp.toInt()}", 
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 8, color: CTColor(curTemp))
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: 100);
    final isPastHalf = i > ticks / 2;
    final isHalf = i == ticks / 2;
    final initialPosition = Offset(isPastHalf ? - painter.width : (isHalf ? - painter.width / 2 : 0), - painter.height / 2);
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
      || oldDelegate.temperature != temperature
      || oldDelegate.step != step
    );
  }
}

//class Temperature

enum IndicatorMode {
  step,
  unit
}