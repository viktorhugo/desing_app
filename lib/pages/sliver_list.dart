import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _MainWidgets(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _FloatButton()
          )
        ],
      )
    );
  }
}

class _FloatButton extends StatelessWidget {
  const _FloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        color: const Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        onPressed: () {
          // Do something when the button is pressed
        },
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      )
    );
  }
}

class _MainWidgets extends StatelessWidget {

  static List<_ListItem> items = [
    const _ListItem( title:'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title:'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title:'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title:'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title:'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title:'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title:'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title:'Books', color: Color(0xffFCEBAF) ),
  ];

  const _MainWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        
        // const SliverAppBar( // ESTE SLIVER APPBAR IGUAL QUE EL APPBAR PERO SE ESCONDE CON EL SCROLL
        //   floating: true,
        //   elevation: 0, 
        //   backgroundColor: Colors.red,
        //   title: Text('HELLO WoRlD'),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 180,
            maxHeight: 190,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Header(),
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100,)
          ])
        )
      ],
    ); // este recibe slivers
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;

_SliverCustomHeaderDelegate({
    required this.minHeight, 
    required this.maxHeight, 
    required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return  maxHeight != oldDelegate.maxHeight ||
            minHeight != oldDelegate.minExtent ||
            child != oldDelegate.child;
  }
  
}

class _TaskList extends StatelessWidget {

  static List<_ListItem> items = [
    const _ListItem( title:'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title:'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title:'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title:'Books', color: Color(0xffFCEBAF) ),
    const _ListItem( title:'Orange', color: Color(0xffF08F66) ),
    const _ListItem( title:'Family', color: Color(0xffF2A38A) ),
    const _ListItem( title:'Subscriptions', color: Color(0xffF7CDD5) ),
    const _ListItem( title:'Books', color: Color(0xffFCEBAF) ),
  ];

  const _TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context,int index) => items[index]
    );
  }
}

class _Header extends StatelessWidget {

  

  const _Header({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text('New', style: TextStyle( color: Color(0xff532128), fontSize: 50 ),),
        ),

        Stack(
          alignment: Alignment.centerRight,
          children: [

            // const SizedBox(width: 100,),
            
            const Text('List', style: TextStyle( color: Colors.pink, fontSize: 50 , fontWeight: FontWeight.bold),),
            
            Positioned(
              bottom: 8,
              child: Container(
                width: 90,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xffD93A30)
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListItem extends StatelessWidget {

  final String title;
  final Color color;

  const _ListItem({
    super.key,
    required this.title, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),),
    );
  }
}