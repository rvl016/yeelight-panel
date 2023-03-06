import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/panels/device_control/white/color_presenter.dart';
import 'package:yeelight_panel/panels/device_control/white/kelvin_curve.dart';
import 'package:yeelight_panel/panels/device_control/white/brightness_slider.dart';
import 'package:yeelight_panel/panels/device_control/white/temperature_control.dart';

class WhitePanel extends StatelessWidget {
  const WhitePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          BrightnessSlider(brightness: 255.obs),
          Row(
            children: [
              Framed(child: TemperatureControl(temperature: 3200.obs, indicatorMode: IndicatorMode.unit.obs, step: 0.obs)),
              const Framed(child: KelvinCurve()),
              Framed(child: ColorPresenter(color: Colors.black.obs)),
            ],
          ),
        ]
      ),
    );
  }
}

