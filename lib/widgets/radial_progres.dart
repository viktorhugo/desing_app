import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final double percentage;
  final Color? primaryColor;
  final Color? secondaryColor;
  final double strokePrimary;
  final double strokeSecondary;

  const RadialProgress({
    super.key, 
    required this.percentage,
    this.primaryColor = Colors.purple, 
    this.secondaryColor = Colors.grey,
    this.strokeSecondary = 4,
    this.strokePrimary = 10
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double afterPercentage;

  @override
  void initState() {
    
    afterPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // SE LLAMA CADA VEZ QUE SE REDIBUJA EL WIDGET SE REDIBUJA LA ANIMACION (from)
    controller.forward(from: 0.0);
    final diffAnt = widget.percentage - afterPercentage;
    afterPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        padding: const EdgeInsets.all(10),
        // child: Center(child: Text('${widget.percentage} %', style: const TextStyle(fontSize: 50),)),
        width: double.infinity, // ANCHO Y ALTO MAXIMO
        height: double.infinity,
        child: CustomPaint(
          painter: _MyRadialProgress(
            percentage: (widget.percentage - diffAnt) + (diffAnt * controller.value), 
            primaryColor: widget.primaryColor! ,
            secondaryColor: widget.secondaryColor!,
            strokePrimary: widget.strokePrimary,
            strokeSecondary: widget.strokeSecondary,
          ),
        ),
      ),
    );

  }
}


class _MyRadialProgress extends CustomPainter {
  
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double strokeSecondary;
  final double strokePrimary;

  _MyRadialProgress( {
    required this.secondaryColor,
    required this.primaryColor, 
    required this.percentage,
    required this.strokeSecondary,
    required this.strokePrimary,
  }): super ();

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 0), 
      radius: 180
    );

    const Gradient gradient = LinearGradient(
      colors: [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red,
      ]
    );

    // circle completed
    final paint = Paint()
      ..strokeWidth = strokeSecondary
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    
    canvas.drawCircle(center, radius, paint);

    // arco  
    final paintArco = Paint()
      ..strokeWidth = strokePrimary
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke;

    // lo que se llenara
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), // espacio donde va estar ubicado
      - pi / 2, // startAngle
      arcAngle, // sweepAngle angulo de llenado
      false, 
      paintArco
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}