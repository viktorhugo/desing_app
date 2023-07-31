import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  const AnimatedRectangle({
    super.key,
  });

  @override
  State<AnimatedRectangle> createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle> with SingleTickerProviderStateMixin{

  // un control para manejar la animacion
  late final AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRight;
  late Animation<double> bigger;

  @override
  void initState() {
    
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000)
    );

    rotation = Tween(
      begin: 0.0,
      end: 2 * Math.pi
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    // otra animacion con la opacidad
    opacity = Tween(
      begin: 0.1,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0, 0.25, curve: Curves.easeInOut) // aplica el opacity solo para el 25% de los 2500 milliseconds
      )
    );

    opacityOut = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.75, 1.0) // aplica el opacity solo para el 25% de los 2500 milliseconds
      )
    );
    // ).animate(controller);

    moveRight = Tween(
      begin: 0.0,
      end: 200.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    bigger = Tween(
      begin: 0.0,
      end: 2.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    controller.addListener(() {
      // print('status ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        // controller.reverse();
        // controller.reset();
        controller.repeat();
      }
      // if (controller.status == AnimationStatus.dismissed) { 
      //   controller.forward();
      // }

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

    //play
    // controller.repeat();
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: const Rectangle(),
      builder: (context, child) {
        // print(rotation.value);
        // print('opacity status ${opacity.value}');
        // print(' rotation status ${rotation.value}');
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: bigger.value,
                child: child
              ),
            ),
          ),
        );
      },
    );
  }
}

class Rectangle extends StatelessWidget {
  
  const Rectangle({super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
    );
  }
}