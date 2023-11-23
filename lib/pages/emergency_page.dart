import 'package:desing_app/widgets/buttons.dart';
import 'package:desing_app/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: Center(
        child: ButtonLx(),
      )
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      title: 'You have requested',
      subTitle: 'Medical assistance',
      icon: FontAwesomeIcons.plus,
      color1: Color(0xff526BF6), 
      color2: Color(0xff67ACF2),
    );
  }
}