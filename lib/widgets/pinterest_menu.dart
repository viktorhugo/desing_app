import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed, 
    required this.icon
  });

}

class PinterestMenu extends StatelessWidget {

  List<PinterestButton> menuItems = [
    PinterestButton(onPressed: () { print('Icon pie_chart'); }, icon: Icons.pie_chart),
    PinterestButton(onPressed: () { print('Icon search'); }, icon: Icons.search),
    PinterestButton(onPressed: () { print('Icon notifications'); }, icon: Icons.notifications),
    PinterestButton(onPressed: () { print('Icon supervised_user_circle'); }, icon: Icons.supervised_user_circle),
  ];

  PinterestMenu({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuProvider(),
      child: _PinterestMenuBackground(
        child: _MenuItems(menuItems: menuItems ) 
      ),
    );
  }
}

// =============== solo para construir el menu ==============
class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;

  const _PinterestMenuBackground({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [ // lista de sombras
          BoxShadow(
            color: Colors.black38,
            offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    );
  }
}

// ===============  ==============
class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems({
    super.key,
    required this.menuItems
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,// no es mejor 
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index: index, item: menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({
    super.key, 
    required this.index, 
    required this.item
  });

  @override
  Widget build(BuildContext context) {

    final itemSelected = Provider.of<_MenuProvider>(context).itemSelected;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuProvider>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: itemSelected == index ? 35 : 25,
        color: itemSelected == index ? Colors.black : Colors.blueGrey,
      ),
    );
  }
}

class _MenuProvider with ChangeNotifier {
  
  int _itemSelected = 0;

  int get itemSelected => _itemSelected;

  set itemSelected(int value) { 
    _itemSelected = value;
    notifyListeners();
  }
}