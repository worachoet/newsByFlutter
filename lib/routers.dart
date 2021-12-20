import 'package:flutter/material.dart';
import 'package:newsflutter/screens/Dashboard/dashboardscreen.dart';
import 'package:newsflutter/screens/drawermenu/aboutusscreen.dart';
import 'package:newsflutter/screens/drawermenu/categoryscreen.dart';
import 'package:newsflutter/screens/drawermenu/lastestnewlistscreen.dart';
import 'package:newsflutter/screens/drawermenu/settingscreen.dart';
import 'package:newsflutter/screens/drawermenu/videolistscreen.dart';
import 'package:newsflutter/screens/login/loginscreen.dart';
import 'package:newsflutter/screens/newsdetail/newdetail.dart';

//สร้าง ตัวแปร Map ไว้เก็บ Url และ Screen

Map<String, WidgetBuilder> routes = {
  "/dashboard": (BuildContext context) => DashboardScreen(),
  "/lastest_news": (BuildContext context) => LastestNewListScreen(),
  "/category": (BuildContext context) => CategoryScreen(),
  "/videoList": (BuildContext context) => VideoListScreen(),
  "/about": (BuildContext context) => AboutUsScreen(),
  "/setting": (BuildContext context) => SettingScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/newdetail": (BuildContext context) => NewDetail(),

};
