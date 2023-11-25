import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonLx extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final VoidCallback onPress;

  const ButtonLx({
    super.key, 
    required this.icon, 
    required this.text, 
    required this.color1, 
    required this.color2, 
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonLxBackground(
            color1: color1,
            color2:color2,
            icon: icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140,width: 40),
              FaIcon(icon, color: Colors.white, size: 40,),
              const SizedBox(width: 20),
              Expanded(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),)),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 40,),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonLxBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  final IconData icon;
  
  const _ButtonLxBackground({
    super.key, 
    required this.color1, 
    required this.color2,
    required this.icon, 
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
        borderRadius: const BorderRadius.all(Radius.circular(15)), // cortar los bordes si algo se sale
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.4),)
            )
          ],
        ),
      ),
    );
  }
}