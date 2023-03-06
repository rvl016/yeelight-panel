import 'package:flutter/cupertino.dart';
import 'package:yeelight_panel/panels/device_control/color/panel.dart';

class ColorWheelDeviceControPanelLayout extends StatelessWidget {
  const ColorWheelDeviceControPanelLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(child: ColorPanel()),
              Container(child: PalettesList())
            ],
          ),
          Container(child: PaletteColors())
        ]
      ),
    );
  }
}

class PalettesList extends StatelessWidget {
  const PalettesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}

class PaletteColors extends StatelessWidget {
  const PaletteColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}


