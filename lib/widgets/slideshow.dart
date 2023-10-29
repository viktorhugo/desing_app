import 'package:flutter/material.dart';

import 'package:desing_app/helpers/enums.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {
  
  final List<Widget> slides;
  final DotPosition dotsPosition;
  final Color? bulletPrimaryColor;
  final Color? bulletSecondaryColor;
  final double? bulletPrimarySize;
  final double? bulletSecondarySize;

  const SlideShow({ // ARGUMENTO POR NOMBRE
    super.key,
    required this.slides, 
    required this.dotsPosition, 
    this.bulletPrimaryColor, 
    this.bulletSecondaryColor, 
    this.bulletPrimarySize, 
    this.bulletSecondarySize
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _SlidesProvider(),
      child: SafeArea(
        child: Center(
            child: Builder( // el builder construye primero desde el changenotifier y luego el context
              builder: (context) {
                // WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (bulletPrimaryColor != null ) Provider.of<_SlidesProvider>(context, listen: false).bulletPrimaryColor = bulletPrimaryColor!;
                  if (bulletSecondaryColor != null ) Provider.of<_SlidesProvider>(context, listen: false).bulletSecondaryColor = bulletSecondaryColor!;
                  if (bulletPrimarySize != null ) Provider.of<_SlidesProvider>(context, listen: false).bulletPrimarySize = bulletPrimarySize!;
                  if (bulletSecondarySize != null ) Provider.of<_SlidesProvider>(context, listen: false).bulletSecondarySize = bulletSecondarySize!;
                // });
                return Column(
                  children: [
                    // DOTS
                    if (dotsPosition == DotPosition.up) _Dots( totalDots: slides.length, ),
                    
                    // SLIDES 
                    Expanded(
                      child: _Slides(slides)
                    ),
                    
                    // DOTS
                    if (dotsPosition == DotPosition.down) _Dots( totalDots: slides.length )
                  ],
                );
              },
            ),
          ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  
  final int totalDots;
  
  const _Dots({ super.key, required this.totalDots });

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
        children: List.generate(totalDots, (index) => _Dot( index: index )
        ),
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
    final slideProvider = Provider.of<_SlidesProvider>(context);
    double size;
    Color color;
    // para que los valores no sean exactos si no comiense un 0.5 antes  
    if (slideProvider.currentPage >= (index - 0.5) && slideProvider.currentPage < (index + 0.5)) {
      size = slideProvider.bulletPrimarySize;
      color = slideProvider.bulletPrimaryColor;
    } else {
      size = slideProvider.bulletSecondarySize;
      color = slideProvider.bulletSecondaryColor;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        // color: Colors.deepPurple[400],
        color: color,
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
      Provider.of<_SlidesProvider>(context, listen: false).currentPage = pageViewController.page!;
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


// este provider solo va funcionar aca dentro
class _SlidesProvider extends ChangeNotifier{

  double _currentPage = 0;
  Color _bulletPrimaryColor = Colors.deepPurple[400]!;
  Color _bulletSecondaryColor = Colors.grey;
  double _bulletPrimarySize = 14;
  double _bulletSecondarySize = 14;

  // Getters
  double get currentPage => _currentPage;
  Color get bulletPrimaryColor => _bulletPrimaryColor;
  Color get bulletSecondaryColor => _bulletSecondaryColor;
  double get bulletPrimarySize => _bulletPrimarySize;
  double get bulletSecondarySize => _bulletSecondarySize;

  // Setters
  set currentPage(double currentPage) {
    _currentPage = currentPage;
    // notifica el nuevo valor a los widgets que esten escuchando 
    notifyListeners(); 
  }
  set bulletPrimaryColor(Color color) {
    _bulletPrimaryColor = color;
  }
  set bulletSecondaryColor(Color color) {
    _bulletSecondaryColor = color;
  }
  set bulletPrimarySize(double size) {
    _bulletPrimarySize = size;
  }
  set bulletSecondarySize(double size) {
    _bulletSecondarySize = size;
  }
}
