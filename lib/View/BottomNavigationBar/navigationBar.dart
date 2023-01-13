import 'package:flutter/material.dart';
import 'package:homeware_store/View/Home/homePage.dart';
import 'package:homeware_store/View/Pages/profile.dart';
import 'package:homeware_store/View/Pages/shopPage.dart';
import 'package:homeware_store/View/Pages/starPage.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex = 0;

  static List<Widget> myPages = [HomePage(), StarPage(), Profile(), ShopPage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: myPages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            // selectedItemColor: Colors.black,
            showSelectedLabels: false,
            // unselectedItemColor: Colors.grey,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      'assets/icons/4.png',
                      height: 20,
                      color: _currentIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      'assets/icons/7.png',
                      height: 20,
                      color: _currentIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      'assets/icons/6.png',
                      height: 20,
                      color: _currentIndex == 2 ? Colors.black : Colors.grey,
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    child: Image.asset(
                      'assets/icons/10.png',
                      height: 20,
                      color: _currentIndex == 3 ? Colors.black : Colors.grey,
                    ),
                  ),
                  label: ''),
            ]),
      ),
    );
  }
}
