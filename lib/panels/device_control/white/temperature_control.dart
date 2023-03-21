import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/common/ct_color.dart';

import '../color_wheel_panel.dart';

class TemperatureControl extends StatelessWidget {
  const TemperatureControl({
    required this.temperature, 
    required this.indicatorMode, 
    required this.step,
    required this.minTemp,
    required this.maxTemp,
    super.key, 
  });

  final RxDouble temperature;
  final Rx<IndicatorMode> indicatorMode;
  final RxDouble step;
  final RxDouble minTemp;
  final RxDouble maxTemp;


  @override
  Widget build(BuildContext context) {
    return ColorWheelPanel(
      title: "Color Temperature",
      getColor: (temp) => CTColor(temp.toInt()),
      getValueLabel: (temp) => "${temp.toInt()}",
      valueUnit: "K",
      indicatorMode: indicatorMode,
      maxVal: maxTemp,
      minVal: minTemp,
      step: step,
      value: temperature,
    );
  }
}
