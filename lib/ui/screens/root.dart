import 'package:flutter/material.dart';
import 'package:week_3_task/ui/screens/cart/cart.dart';
import 'package:week_3_task/ui/screens/home/home.dart';

class RootBar extends StatefulWidget {
  const RootBar({Key? key}) : super(key: key);

  @override
  State<RootBar> createState() => _RootBarState();
}

class _RootBarState extends State<RootBar> {
  int _pageIndex = 0;

  static List<Widget> Screen = <Widget>[
    Home(),
    Cart(),
  ];

  _itemTapedIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _pageIndex,
          onTap: _itemTapedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cart'),
            // BottomNavigationBarItem(icon: Icon(Icons.shopping_cart)),
            // BottomNavigationBarItem(icon: Icon(Icons.list)),
          ]),
    );
  }
}
