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

  final bool showMenu;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final List<PinterestButton> menuItems;

  const PinterestMenu({
    super.key, 
    required this.showMenu, 
    required this.menuItems, 
    this.backgroundColor, 
    this.activeColor, 
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _MenuProvider(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: showMenu ? 1 : 0,
        child: Builder( // emvolvemos en un builder para poder usar el provider
          builder: (context) {

            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<_MenuProvider>(context, listen: false).inactiveColor = inactiveColor!;
              Provider.of<_MenuProvider>(context, listen: false).activeColor = activeColor!;
              Provider.of<_MenuProvider>(context, listen: false).backgroundColor = backgroundColor!;
            });
            return _PinterestMenuBackground(
              backgroundColor: backgroundColor,
              child: _MenuItems(menuItems: menuItems ),
            );
          }
        ) 
      ),
    );
  }
}

// =============== solo para construir el menu ==============
class _PinterestMenuBackground extends StatelessWidget {
  
  final Widget child;
  final Color? backgroundColor;

  const _PinterestMenuBackground({
    super.key, 
    required this.child,
    this.backgroundColor, 
  });

  @override
  Widget build(BuildContext context) {

    final backgroundColor = Provider.of<_MenuProvider>(context).backgroundColor;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const [ // lista de sombras
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
    required this.menuItems, 
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,// no es mejor 
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(
          index: index, 
          item: menuItems[index],
        ),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({
    super.key, 
    required this.index, 
    required this.item,
  });

  @override
  Widget build(BuildContext context) {

    final itemSelected = Provider.of<_MenuProvider>(context).itemSelected;
    final activeColor = Provider.of<_MenuProvider>(context).activeColor;
    final inactiveColor = Provider.of<_MenuProvider>(context).inactiveColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuProvider>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: itemSelected == index ? 35 : 25,
        color: itemSelected == index ? activeColor : inactiveColor,
      ),
    );
  }
}

class _MenuProvider with ChangeNotifier {
  
  int _itemSelected = 0;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;
  Color _backgroundColor = Colors.white;

  int get itemSelected => _itemSelected;
  Color get activeColor => _activeColor;
  Color get inactiveColor => _inactiveColor;
  Color get backgroundColor => _backgroundColor;

  set itemSelected(int value) { 
    _itemSelected = value;
    notifyListeners();
  }

  set activeColor(Color value) { 
    _activeColor = value;
    notifyListeners();
  }

  set inactiveColor(Color value) { 
    _inactiveColor = value;
    notifyListeners();
  }

  set backgroundColor(Color value) { 
    _backgroundColor = value;
    notifyListeners();
  }
}