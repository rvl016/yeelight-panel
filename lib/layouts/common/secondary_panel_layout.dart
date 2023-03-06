import 'package:flutter/material.dart';


class SecondaryPanelLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const SecondaryPanelLayout({
    super.key, 
    required this.title, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title),
          child
        ]
      ),
    );
  }
}