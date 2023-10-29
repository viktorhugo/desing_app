import 'package:desing_app/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:desing_app/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    const String svg1 = 'assets/svgs/undraw_1.svg';
    const String svg2 = 'assets/svgs/undraw_2.svg';
    const String svg3 = 'assets/svgs/undraw_3.svg';
    const String svg4 = 'assets/svgs/undraw_4.svg';
    const String svg5 = 'assets/svgs/undraw_5.svg';

    return const Scaffold(
      // backgroundColor: Colors.deepOrange[100],
      body: Column(
        children: [
          Expanded(child: MySlideShow(svg1: svg1, svg2: svg2, svg3: svg3, svg4: svg4, svg5: svg5),),
          // Expanded(child: MySlideShow(svg1: svg1, svg2: svg2, svg3: svg3, svg4: svg4, svg5: svg5),)
        ],
      )
    );
  }
}

class MySlideShow extends StatelessWidget {
  
  const MySlideShow({
    super.key,
    required this.svg1,
    required this.svg2,
    required this.svg3,
    required this.svg4,
    required this.svg5,
  });

  final String svg1;
  final String svg2;
  final String svg3;
  final String svg4;
  final String svg5;

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      slides: [
        SvgPicture.asset(svg1),
        SvgPicture.asset(svg2),
        SvgPicture.asset(svg3),
        SvgPicture.asset(svg4),
        SvgPicture.asset(svg5),
      ],
      dotsPosition: DotPosition.down,
      bulletPrimaryColor: Colors.deepPurpleAccent[200],
      bulletSecondaryColor: Colors.black38,
      bulletPrimarySize: 22.0,
      bulletSecondarySize: 10.0,
    );
  }
}