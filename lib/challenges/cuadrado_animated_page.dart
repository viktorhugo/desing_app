
import 'package:flutter/material.dart';

class CuadradoAnimatedPage extends StatelessWidget {
  const CuadradoAnimatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimated(),
      ),
    );
  }
}

class _CuadradoAnimated extends StatefulWidget {
  const _CuadradoAnimated({
    super.key,
  });

  @override
  State<_CuadradoAnimated> createState() => _CuadradoAnimatedState();
}

class _CuadradoAnimatedState extends State<_CuadradoAnimated> with SingleTickerProviderStateMixin{

  late final AnimationController controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500)
    );
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {

    moveRight = Tween(
      begin: 0.0,
      end: 100.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.0, 0.25, curve: Curves.bounceOut)
      )
    );

    moveUp = Tween(
      begin: 0.0,
      end: -100.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)
      )
    );

    moveLeft = Tween(
      begin: 0.0,
      end: -100.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)
      )
    );

    moveDown = Tween(
      begin: 0.0,
      end: 100.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)
      )
    );
    
    // controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 4000)
    // );

    controller.addListener(() {
      // print('status ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }

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
    
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: const _Rectangle(),
      builder: (context, child) {
        // print(rotation.value);
        // print('opacity status ${opacity.value}');
        // print(' rotation status ${rotation.value}');
      
        return Transform.translate(
          offset: Offset(moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle({super.key});
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