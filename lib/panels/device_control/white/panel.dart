import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/bridge_definitions.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/data/app_state.dart';
import 'package:yeelight_panel/data/model_state.dart';
import 'package:yeelight_panel/panels/device_control/white/color_presenter.dart';
import 'package:yeelight_panel/panels/device_control/white/kelvin_curve.dart';
import 'package:yeelight_panel/panels/device_control/white/brightness_slider.dart';
import 'package:yeelight_panel/panels/device_control/white/temperature_control.dart';

class WhitePanel extends StatelessWidget {
  
  const WhitePanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelData = context.watch<ControlPanels>().whitePanel;
    return Column(
      children: [
        BrightnessSlider(brightness: panelData.brightness),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Framed(
              child: TemperatureControl(
                temperature: panelData.temperature, 
                indicatorMode: panelData.indicatorMode,
                step: panelData.step,
                maxTemp: panelData.maxTemp,
                minTemp: panelData.minTemp,
              ),
            ),
            const Framed(child: KelvinCurve()),
          ],
        ),
      ]
    );
  }
}
