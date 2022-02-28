// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wordsreminder/view/Dashboard.dart';
import 'package:wordsreminder/view/Profile.dart';
import 'package:wordsreminder/view/Search.dart';

void main() {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      home: NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 58,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  //update activeIndex number
                  activeIndex = 0;
                });
              },
              child: Icon(
                Icons.home,
                size: activeIndex == 0 ? 40 : 30,
                color: activeIndex == 0 ? Colors.white : Colors.grey[350],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //update activeIndex number
                  activeIndex = 1;
                });
              },
              child: Icon(
                Icons.search,
                size: activeIndex == 1 ? 40 : 30,
                color: activeIndex == 1 ? Colors.white : Colors.grey[350],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  //update activeIndex number
                  activeIndex = 2;
                });
              },
              child: Icon(
                Icons.person,
                size: activeIndex == 2 ? 40 : 30,
                color: activeIndex == 2 ? Colors.white : Colors.grey[350],
              ),
            )
          ],
        ),
      ),
      body: getViewForIndex(activeIndex),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return Dashboard();
      case 1:
        return Search();
      case 2:
        return Profile();

      default:
        return Dashboard();
    }
  }
}
