import 'package:flutter/material.dart';

class ColorWheel extends StatelessWidget {
  const ColorWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}



class ColorWheelSelector extends StatelessWidget {
  
  const ColorWheelSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ColorPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    //final paint = Paint()
    //  ..shader = Gradient(
    //    colors: [Color(0xFFFF0000), Color(0xFF00FF00), Color(0xFF0000FF)]
    //  );
    //// TODO: implement paint
    //canvas.drawCircle(Offset(0, 0), 100.0, paint)
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}