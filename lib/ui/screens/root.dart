import 'package:flutter/material.dart';
import 'package:week_3_task/ui/screens/cart/cart2.dart';
import 'package:week_3_task/ui/screens/home/home.dart';
import 'package:week_3_task/ui/screens/list/list.dart';
import 'package:week_3_task/ui/screens/profile/profile_screen.dart';

class RootBar extends StatefulWidget {
  const RootBar({Key? key}) : super(key: key);

  @override
  State<RootBar> createState() => _RootBarState();
}

class _RootBarState extends State<RootBar> {
  int _pageIndex = 0;

  static List<Widget> screen = <Widget>[
    const Home(),
    const Profile(),
    Cart2(),
    const ListScreen()
  ];

  _itemTapedIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _pageIndex,
          selectedFontSize: 1,
          // iconSize: 12,
          onTap: _itemTapedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart Screen'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_add), label: 'List Screen'),
          ]),
    );
  }
}
