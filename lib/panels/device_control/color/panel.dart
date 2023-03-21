import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeelight_panel/common/framed.dart';
import 'package:yeelight_panel/data/app_state.dart';

import '../white/brightness_slider.dart';
import 'color_control.dart';

class ColorPanel extends StatelessWidget {
  const ColorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final panelData = context.watch<ControlPanels>().colorPanel;
    return Column(
      children: [
        Framed(child: BrightnessSlider(brightness: panelData.brightness)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HueControl(
              hue: panelData.hue,
              saturation: panelData.saturation,
              step: panelData.step,
              indicatorMode: panelData.indicatorMode,
            ),
            SaturationControl(
              hue: panelData.hue,
              saturation: panelData.saturation,
              step: panelData.step,
              indicatorMode: panelData.indicatorMode,
            ),
          ],
        ),
      ]
    );
  }
}
