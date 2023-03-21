import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color_wheel_panel.dart';

class HueControl extends StatelessWidget {
  const HueControl({
    required this.hue, 
    required this.saturation, 
    required this.indicatorMode, 
    required this.step,
    super.key,
  });

  final RxDouble hue;
  final RxDouble saturation;
  final Rx<IndicatorMode> indicatorMode;
  final RxDouble step;


  @override
  Widget build(BuildContext context) {
    return ColorWheelPanel(
      title: "Color Hue",
      getColor: (hue) => HSVColor.fromAHSV(1.0, math.min(math.max(hue, 0), 1) * 360, saturation.value, 1.0).toColor(),
      getValueLabel: (hue) => "${(hue * 360).toInt()}",
      valueUnit: "°",
      indicatorMode: indicatorMode,
      maxVal: 1.0.obs,
      minVal: 0.0.obs,
      step: step,
      value: hue,
    );
  }
}


class SaturationControl extends StatelessWidget {
  const SaturationControl({
    required this.hue, 
    required this.saturation, 
    required this.indicatorMode, 
    required this.step,
    super.key,
  });

  final RxDouble hue;
  final RxDouble saturation;
  final Rx<IndicatorMode> indicatorMode;
  final RxDouble step;


  @override
  Widget build(BuildContext context) {
    return ColorWheelPanel(
      title: "Color Saturation",
      getColor: (sat) => HSVColor.fromAHSV(1.0, (hue % 1) * 360, math.max(0, math.min(sat, 1.0)), 1.0).toColor(),
      getValueLabel: (sat) => "${(sat * 100).toInt()}",
      valueUnit: "%",
      indicatorMode: indicatorMode,
      maxVal: 1.0.obs,
      minVal: 0.0.obs,
      step: step,
      value: saturation,
    );
  }
}