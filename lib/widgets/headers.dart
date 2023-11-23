import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0Xff615AAB),
    );
  }
}

class HeaderBorderRounded extends StatelessWidget {
  const HeaderBorderRounded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color:  Color(0Xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70), 
          bottomRight: Radius.circular(70)
        )
      ),
    );
  }
}


class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0XffFFFFFF),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // pen
    final pen = Paint();
    pen.color =const Color(0Xff615AAB);
    pen.style = PaintingStyle.fill; // .stroke .fill
    pen.strokeWidth = 5;

    final path = Path();

    // draw with pen
    path.moveTo(0, size.height *0.35);
    // path.lineTo(0, size.height *0.4);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height *0.4);

    //draw path
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



class HeaderTriangle extends StatelessWidget {
  const HeaderTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0XffFFFFFF),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // pen
    final pen = Paint();
    pen.color =const Color(0Xff615AAB);
    pen.style = PaintingStyle.fill; // .stroke .fill
    pen.strokeWidth = 50;

    final path = Path();

    // draw with pen
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    // path.lineTo(0, size.height);

    //draw path
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderHectagono extends StatelessWidget {
  const HeaderHectagono({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0XffFFFFFF),
      child: CustomPaint(
        painter: _HeaderHectagonoPainter(),
      ),
    );
  }
}

class _HeaderHectagonoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // pen
    final pen = Paint();
    pen.color =const Color(0Xff615AAB);
    pen.style = PaintingStyle.fill; // .stroke .fill
    pen.strokeWidth = 50;

    final path = Path();

    // draw with pen
    path.lineTo(0, size.height *0.32);
    path.lineTo(size.width*0.5, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.32);
    path.lineTo(size.width, 0);

    //draw path
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderCurve extends StatelessWidget {
  const HeaderCurve({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0XffFFFFFF),
      child: CustomPaint(
        painter: _HeaderCurvePainter(),
      ),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // pen
    final pen = Paint();
    pen.color =const Color(0Xff615AAB);
    pen.style = PaintingStyle.fill; // .stroke .fill
    pen.strokeWidth = 20;

    final path = Path();

    // draw with pen
    path.lineTo(0, size.height *0.26);
    path.quadraticBezierTo(
      size.width * 0.5, // size de la curva x
      size.height * 0.4, // size de la curva y
      size.width, // toda la pantalla de ancha
      size.height *0.26 // size de y
    );
    path.lineTo(size.width, 0);

    //draw path
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderWaves extends StatelessWidget {
  const HeaderWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0XffFFFFFF),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // pen
    final pen = Paint();
    pen.color =const Color(0Xff615AAB);
    pen.style = PaintingStyle.fill; // .stroke .fill
    pen.strokeWidth = 20;

    final path = Path();

    // draw with pen
    path.lineTo(0, size.height *0.30);
    path.quadraticBezierTo(
      size.width * 0.25, // size de la curva x
      size.height * 0.35, // size de la curva y
      size.width *0.5, // toda la pantalla de ancha
      size.height *0.30 // size de y
    );
    path.quadraticBezierTo(
      size.width * 0.75, // size de la curva x
      size.height * 0.25, // size de la curva y
      size.width , // toda la pantalla de ancha
      size.height *0.30 // size de y
    );

    path.lineTo(size.width, 0);

    //draw path
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0XffFFFFFF),
      child: CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    const Gradient gradient = LinearGradient( // si agrega un nuevo color tambien agregar un stop
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      // Valores porcentuales en los que los colores trabajen
      stops: [
        0.1,
        0.5,
        1.0
      ]
    );

    final Rect rect = Rect.fromCircle(
      center: Offset(0.0, 55.0), 
      radius: 180
    );

    // pen
    final pen = Paint()..shader = gradient.createShader(rect);
    // pen.color =const Color(0Xff615AAB);
    pen.style = PaintingStyle.fill; // .stroke .fill
    pen.strokeWidth = 20;

    final path = Path();

    // draw with pen
    path.lineTo(0, size.height *0.30);
    path.quadraticBezierTo(
      size.width * 0.25, // size de la curva x
      size.height * 0.35, // size de la curva y
      size.width *0.5, // toda la pantalla de ancha
      size.height *0.30 // size de y
    );
    path.quadraticBezierTo(
      size.width * 0.75, // size de la curva x
      size.height * 0.25, // size de la curva y
      size.width , // toda la pantalla de ancha
      size.height *0.30 // size de y
    );

    path.lineTo(size.width, 0);

    //draw path
    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;

  const IconHeader({
    super.key,
    required this.icon, 
    required this.title, 
    required this.subTitle, 
    required this.color1, 
    required this.color2 
  });

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        // background
        _HeaderBackground( color1: color1,  color2: color2 ),
        
        // plus icon
        Positioned(
          top: -50,
          left: -60,
          child: FaIcon( icon , size: 250, color: Colors.white.withOpacity(0.2),)
        ),
        
        // texts
        Center(
          child: Column(
            children: [
              const SizedBox( height: 90 ),
              Text( title, style: TextStyle( fontSize: 22, color: Colors.white.withOpacity(0.7)), ),
              const SizedBox( height: 20 ),
              Text( subTitle, style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)), ),
              const SizedBox( height: 20 ),
              FaIcon( icon , size: 90, color: Colors.white, )
            ],
          ),
        )
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;
  
  const _HeaderBackground({
    super.key, 
    required this.color1, 
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //primero la parte azul con el gradiente
      width: double.infinity,
      height: 300,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2
          ]
        )
      ),
    );
  }
}