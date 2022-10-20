import 'package:flutter/material.dart';
import 'package:rehab4wrestling/packages/human_body_selector/svg_painter/models/body_part.dart';

import '../size_controller.dart';

class SvgPainter extends CustomPainter {
  final BodyPart city;
  final bool isSelected;
  final bool isFocused;
  final Color? strokeColor;
  final Color? selectedColor;
  final Color? dotColor;
  final Listenable? repaint;

  final sizeController = SizeController.instance;

  double scale = 1.0;

  SvgPainter(
      {required this.city,
      this.isSelected = false,
      this.isFocused = false,
      this.selectedColor,
      this.strokeColor,
      this.dotColor,
      this.repaint,
      this.scale = 10})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint()
      ..color = strokeColor ?? Colors.white60
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final fillPen = Paint()
      ..color = Colors.white60
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final selectedPen = Paint()
      ..color = selectedColor ?? Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;

    final redDot = Paint()
      ..color = dotColor ?? Colors.red
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    final bounds = city.path.getBounds();

    scale = sizeController.calculateScale(size);
    canvas.scale(scale);

    if (isSelected) {
      canvas.drawPath(city.path, selectedPen);
      // if (isFocused) {
      //   final maskPaint = Paint()
      //     ..color = Colors.black
      //     // ..maskFilter = MaskFilter.blur(BlurStyle.outer, 12)
      //     ..style = PaintingStyle.fill;
      //   canvas.drawPath(city.path, maskPaint);
      //   maskPaint.maskFilter = null;
      // }
    } else {
      canvas.drawPath(city.path, fillPen);
    }
    canvas.drawCircle(bounds.center, 5, redDot);
    canvas.drawPath(city.path, pen);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool hitTest(Offset position) {
    double inverseScale = sizeController.inverseOfScale(scale);
    return city.path.contains(position.scale(inverseScale, inverseScale));
  }
}
