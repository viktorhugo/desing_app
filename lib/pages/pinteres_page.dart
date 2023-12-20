import 'package:desing_app/theme/theme.dart';
import 'package:desing_app/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => _MenuProvider(),
      child: const Scaffold(    
        body: Stack( // COLOCAR WIDGETS UNO SOBRE EL OTRO
          children: [
            PinterestGrid(),
            _PinterestMenuPositioned(),
          ],
        ),
        // body: PinterestMenu(),
        
      ),
    );
  }
}

class _PinterestMenuPositioned extends StatelessWidget {
  
  const _PinterestMenuPositioned({super.key });

  @override
  Widget build(BuildContext context) {
    
    final width = MediaQuery.of(context).size.width; 
    final showMenuValue = Provider.of<_MenuProvider>(context).showMenu;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned( // PERMITE UBICAR UN WIDGET DENTRO DE UN STACK
      bottom: 30,
      child: SizedBox(
        width: width,
        child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(
            showMenu: showMenuValue,
            backgroundColor: appTheme.scaffoldBackgroundColor,
            activeColor: appTheme.colorScheme.secondary,
            inactiveColor: Colors.amber[100],
            menuItems: [
              PinterestButton(onPressed: () { print('Icon pie_chart'); }, icon: Icons.pie_chart),
              PinterestButton(onPressed: () { print('Icon search'); }, icon: Icons.search),
              PinterestButton(onPressed: () { print('Icon notifications'); }, icon: Icons.notifications),
              PinterestButton(onPressed: () { print('Icon supervised_user_circle'); }, icon: Icons.supervised_user_circle),
            ],
          ),
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
  double lastValueScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      // print(controller.offset);
      if (controller.offset < 0 ) return;
      if (controller.offset > lastValueScroll) {
        Provider.of<_MenuProvider>(context, listen: false).showMenu = false;
        // print('Hide Menu');
      } else {
        Provider.of<_MenuProvider>(context, listen: false).showMenu = true;
        // print('Show Menu');
      }
      lastValueScroll = controller.offset;
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

class _MenuProvider with ChangeNotifier {
  
  bool _showMenu = true;

  bool get showMenu => _showMenu;

  set showMenu(bool value) {
    _showMenu = value;
    notifyListeners();
  }
}