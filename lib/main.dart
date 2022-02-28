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
          color: Colors.white,
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
                Icons.home_outlined,
                size: 30,
                color: activeIndex == 0
                    ? Color.fromARGB(255, 52, 243, 233)
                    : Colors.grey[350],
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
                size: 30,
                color: activeIndex == 1
                    ? Color.fromARGB(255, 52, 243, 233)
                    : Colors.grey[350],
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
                size: 30,
                color: activeIndex == 2
                    ? Color.fromARGB(255, 52, 243, 233)
                    : Colors.grey[350],
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
