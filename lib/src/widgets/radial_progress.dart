import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percent;
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryStrokeWidth;
  final double secundaryStrokeWidth;

  const RadialProgress({
    Key? key,
    required this.percent,
    this.primaryColor = Colors.blue,
    this.secundaryColor = Colors.grey,
    this.secundaryStrokeWidth = 4.0,
    this.primaryStrokeWidth = 10.0,
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double previousPercent;

  @override
  void initState() {
    previousPercent = widget.percent;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final percentDifference = widget.percent - previousPercent;
    previousPercent = widget.percent;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgress(
              (widget.percent - percentDifference) +
                  (percentDifference * controller.value),
              widget.primaryColor,
              widget.secundaryColor,
              widget.primaryStrokeWidth,
              widget.secundaryStrokeWidth,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double percent;
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryStrokeWidth;
  final double secundaryStrokeWidth;

  _RadialProgress(
    this.percent,
    this.primaryColor,
    this.secundaryColor,
    this.primaryStrokeWidth,
    this.secundaryStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = secundaryStrokeWidth
      ..color = secundaryColor
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    final paintArc = Paint()
      ..strokeWidth = primaryStrokeWidth
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
