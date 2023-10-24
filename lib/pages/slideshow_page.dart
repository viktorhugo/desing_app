import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _Slides()
            ),
            _Dots()
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      // color: Colors.deepPurple[400],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(index: 0),
          _Dot(index: 1),
          _Dot(index: 2),
          _Dot(index: 3),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  
  final int index;

  const _Dot({
    super.key, 
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14,
      height: 14,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        // color: Colors.deepPurple[400],
        color: Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  const _Slides({super.key});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      print('Actual page ${pageViewController.page}');
    });
    super.initState();
  }

  @override
  void dispose() { // siempre para prevenir fugas de memoria
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const String svg1 = 'assets/svgs/undraw_1.svg';
    const String svg2 = 'assets/svgs/undraw_2.svg';
    const String svg3 = 'assets/svgs/undraw_3.svg';
    const String svg4 = 'assets/svgs/undraw_4.svg';

    return Container(
      child: PageView(
        controller: pageViewController,
        children: const [
          _Slide( svg: svg1,),
          _Slide( svg: svg2,),
          _Slide( svg: svg3,),
          _Slide( svg: svg4,),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({
    super.key,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(
        svg,
        semanticsLabel: 'svg1'
      ),
    );
  }
}