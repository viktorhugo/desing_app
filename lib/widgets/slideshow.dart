import 'package:flutter/material.dart';

import 'package:desing_app/models/slider_model.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {
  
  final List<Widget> slides;

  const SlideShow({ // ARGUMENTO POR NOMBRE
    super.key,
    required this.slides
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SliderModel(),
      child: Center(
          child: Column(
            children: [
              
              // SLIDES 
              Expanded(
                child: _Slides(slides)
              ),
              
              // DOTS
              _Dots(totalDots: slides.length)
            ],
          ),
        ),
    );
  }
}

class _Dots extends StatelessWidget {
  
  final int totalDots;
  const _Dots({
    super.key, 
    required this.totalDots
  });

  @override
  Widget build(BuildContext context) {

    // List<_Dot> dots = [];
    // for (int i = 0; i < totalDots; i++) {
    //   dots.add(_Dot(index: i));
    // }
    return SizedBox(
      width: double.infinity,
      height: 70,
      // color: Colors.deepPurple[400],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: dots.toList(),
        children: List.generate(totalDots, (index) => _Dot(index: index)),
      ),
    );
  }
}



class _Dot extends StatelessWidget {
  
  final int index;

  const _Dot({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    
    // we created a listener
    final double actualPageIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 14,
      height: 14,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        // color: Colors.deepPurple[400],
        color: (actualPageIndex >= (index - 0.5) && actualPageIndex < (index + 0.5)) 
          ?Colors.deepPurple[400] 
          : Colors.grey,
        shape: BoxShape.circle
      ),
    );
  }
}



class _Slides extends StatefulWidget {

  final List<Widget> slides;
  
  const _Slides(this.slides); // ARGUMENTO POSICIONAL

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // print('Actual page ${pageViewController.page}');
      // update provider, SliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;
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

    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide)).toList(),
    );
  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  const _Slide( this.slide );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
      // child: SvgPicture.asset(
      //   svg,
      //   semanticsLabel: 'svg1'
      // ),
    );
  }
}