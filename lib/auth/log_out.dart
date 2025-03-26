
import 'package:flutter/material.dart';

import 'package:reci/screenBnb/explore_screen.dart';
import 'package:reci/screenBnb/fff.dart';
import 'package:reci/screenBnb/message_screen.dart';
import 'package:reci/screenBnb/profile_screen.dart';
import 'package:reci/screenBnb/wishlisht.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({super.key});

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  int selectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    pages = [
      ExploreScreen(),
      Wishlisht(),
      MessageScreen(),
      MessageScreen(),
      ProfileScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          iconSize: 32,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  color:
                      selectedIndex == 0 ? Colors.pinkAccent : Colors.black45,
                ),
                label: "Explore"),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(
                Icons.favorite_outline,
                color: selectedIndex == 1 ? Colors.pinkAccent : Colors.black45,
              ),
            ),
            BottomNavigationBarItem(
              label: "Trip",
              icon: Icon(
                Icons.trip_origin_outlined,
                color: selectedIndex == 2 ? Colors.pinkAccent : Colors.black45,
              ),
            ),
            BottomNavigationBarItem(
              label: "message",
              icon: Icon(
                Icons.message_outlined,
                color: selectedIndex == 3 ? Colors.pinkAccent : Colors.black45,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.man,
                color: selectedIndex == 4 ? Colors.pinkAccent : Colors.black45,
              ),
            ),
          ]),
    );
  }
}
