import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    controller.addListener(() {
      // print('value ${controller.value}');
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!; // fn que permite interpolar dos numeros
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.published_with_changes_outlined),
        backgroundColor: Colors.pink[200],
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100 ) {
            newPercentage = 0;
            percentage = 0;
          }
          setState(() {});
          controller.forward(from: 0.0);
        },
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.amber,
          child: CustomPaint(
            painter: _MyRadialProgress(percentage: percentage),
          ),
        ),
      ),
    );
  }
  
}

class _MyRadialProgress extends CustomPainter {
  
  final double percentage;

  _MyRadialProgress({
    required this.percentage
  }): super ();

  @override
  void paint(Canvas canvas, Size size) {

    // circle completed
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    
    canvas.drawCircle(center, radius, paint);

    // arco  
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
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