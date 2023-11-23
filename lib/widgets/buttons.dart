import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonLx extends StatelessWidget {

  

  const ButtonLx({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const Stack(
      children: [
        _ButtonLxBackground(
          color1: Color(0xff6989f5),
          color2: Color(0xff906EF5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 140,width: 40),
            FaIcon(FontAwesomeIcons.carBurst, color: Colors.white, size: 40,),
            SizedBox(width: 20),
            Expanded(child: Text('Motor Accident', style: TextStyle(color: Colors.white, fontSize: 18),)),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 40,),
            SizedBox(width: 40),
          ],
        )
      ],
    );
  }
}

class _ButtonLxBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  
  const _ButtonLxBackground({
    super.key, 
    required this.color1, 
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration:  BoxDecoration(
        // color: Colors.cyan,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 7),
            blurRadius: 10
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            color1,
            color2
          ]
        )
      ),
      
      child: ClipRRect( // cortar los bordes si algo se sale
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(FontAwesomeIcons.carBurst, size: 150, color: Colors.white.withOpacity(0.4),)
            )
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}