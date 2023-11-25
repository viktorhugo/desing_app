import 'package:animate_do/animate_do.dart';
import 'package:desing_app/widgets/buttons.dart';
import 'package:desing_app/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <FadeInLeft>[ // animation FadeInLeft
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.carBurst, text:'Motor Accident', color1:  Color(0xff6989F5), color2: Color(0xff906EF5), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.plus, text:'Medical Emergency', color1:  Color(0xff66A9F2), color2: Color(0xff536CF6), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.masksTheater, text:'Theft / Harrasement', color1:  Color(0xffF2D572), color2: Color(0xffE06AA3), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.personBiking, text:'Awards', color1:  Color(0xff317183), color2: Color(0xff46997D), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.carBurst, text:'Motor Accident', color1:  Color(0xff6989F5), color2: Color(0xff906EF5), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.plus, text:'Medical Emergency', color1:  Color(0xff66A9F2), color2: Color(0xff536CF6), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.masksTheater, text:'Theft / Harrasement', color1:  Color(0xffF2D572), color2: Color(0xffE06AA3), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.personBiking, text:'Awards', color1:  Color(0xff317183), color2: Color(0xff46997D), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.carBurst, text:'Motor Accident', color1:  Color(0xff6989F5), color2: Color(0xff906EF5), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.plus, text:'Medical Emergency', color1:  Color(0xff66A9F2), color2: Color(0xff536CF6), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.masksTheater, text:'Theft / Harrasement', color1:  Color(0xffF2D572), color2: Color(0xffE06AA3), onPress: () { print(' Tab !!!!'); }, )),
      FadeInLeft( duration: const Duration(milliseconds: 500), child: ButtonLx( icon:FontAwesomeIcons.personBiking, text:'Awards', color1:  Color(0xff317183), color2: Color(0xff46997D), onPress: () { print(' Tab !!!!'); }, )),
    ].toList();

    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: Stack(
        children: [
          
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(), // para que en ambos moviles permita ir un pocp mas del scroll
              children:  [
                const SizedBox(height: 80,),
                ...items
              ],
            ),
          ),

          const Header()
        ],
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
    return Stack( // puedo poner widgets unos encima de otros
      children: [
        const IconHeader(
          title: 'You have requested',
          subTitle: 'Medical assistance',
          icon: FontAwesomeIcons.plus,
          color1: Color(0xff526BF6), 
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          right: -10,
          top: 50,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding:const EdgeInsets.all(15),
            child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.amber, size: 30,)
          )
        )
      ],
    );
  }
}


