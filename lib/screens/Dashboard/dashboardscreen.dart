

import 'package:flutter/material.dart';
import 'package:newsflutter/Screens/Bottomnavmenu/BookmarkFragment.dart';
import 'package:newsflutter/Screens/Bottomnavmenu/CategoryFragment.dart';
import 'package:newsflutter/Screens/Bottomnavmenu/HomeFragment.dart';
import 'package:newsflutter/Screens/Bottomnavmenu/ProfileFragment.dart';
import 'package:newsflutter/Screens/Bottomnavmenu/SearchFragment.dart';
import 'package:newsflutter/Theme/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  List<Widget> pages = const [
    HomeFragment(),
    BookmarkFragment(),
    CategoryFragment(),
    SearchFragment(),
    ProfileFragment()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          //คำสั่งในการ render ui
          setState(() {
            
          });
        },
        items:  [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
            activeIcon: Container(
              padding: EdgeInsets.all(6.0),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.3),
              ),
              child: Icon(Icons.home, size: 24.0,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bookmark',
            icon: Icon(Icons.bookmark),
             activeIcon: Container(
               padding: EdgeInsets.all(6.0),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.3),
              ),
              child: Icon(Icons.bookmark, size: 24.0,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
             activeIcon: Container(
               padding: EdgeInsets.all(6.0),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.3),
              ),
              child: Icon(Icons.category, size: 24.0,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search),
             activeIcon: Container(
               padding: EdgeInsets.all(6.0),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.3),
              ),
              child: Icon(Icons.search, size: 24.0,),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
             activeIcon: Container(
               padding: EdgeInsets.all(6.0),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor.withOpacity(0.3),
              ),
              child: Icon(Icons.person, size: 24.0,),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
