import 'package:flutter/cupertino.dart';

class ColorFlowDeviceControPanelLayout extends StatelessWidget {
  const ColorFlowDeviceControPanelLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ColorPath()
        ]
      ),
    );
  }
}

class ColorPath extends StatelessWidget {
  const ColorPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}