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

    return Scaffold(
      body: SlideShow(
        slides: [
          SvgPicture.asset(svg1),
          SvgPicture.asset(svg2),
          SvgPicture.asset(svg3),
          SvgPicture.asset(svg4),
          SvgPicture.asset(svg5),
        ],
      ),
    );
  }
}