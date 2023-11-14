import 'package:desing_app/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(    
      body: Stack( // COLOCAR WIDGETS UNO SOBRE EL OTRO
        children: [
          PinterestGrid(),
          _PinterestMenuPositioned(),
        ],
      ),
      // body: PinterestMenu(),
      
    );
  }
}

class _PinterestMenuPositioned extends StatelessWidget {
  
  const _PinterestMenuPositioned({super.key });

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width; 

    return Positioned( // PERMITE UBICAR UN WIDGET DENTRO DE UN STACK
      bottom: 30,
      child: SizedBox(
        width: width,
        child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(),
        ),
      )
    );
  }
}


class PinterestGrid extends StatefulWidget {// lo cambiamos a un stateFull widget para el listener
  
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  ScrollController controller =  ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      print('Listener scroll ${controller.offset}');
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      controller: controller,
      itemCount: 200,
      crossAxisCount: 2, // cantidad de columnas
      mainAxisSpacing: 0, // bottom space columns
      crossAxisSpacing: 0, //  space intermedio  
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: _PinterestItem(index: index),
        );
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  const _PinterestItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(8),
      height: index % 2 == 0 ? 300 : 180, // size cards
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white, child: Text('$index')
        )
      )
    );
  }
}