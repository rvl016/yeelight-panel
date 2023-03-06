import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yeelight_panel/layouts/common/secondary_panel_layout.dart';

class KelvinCurve extends StatelessWidget {
  const KelvinCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryPanelLayout(
      title: "Kelvin Curve",
      child: Container(
        //child: LineChart(
        //  LineChartData(),
        //  swapAnimationDuration: Duration(milliseconds: 500),
        //  swapAnimationCurve: Curves.ease,
        //),
      ),
    );
  }
}
