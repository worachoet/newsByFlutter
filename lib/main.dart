import 'package:flutter/material.dart';
import 'package:newsflutter/Theme/app_theme.dart';
import 'package:newsflutter/routers.dart';

//สร้างตัวแปรไว้เก็บ url หน้าหลัก
var initUrl;
void main() {
  initUrl = '/dashboard';

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme
          .copyWith(scaffoldBackgroundColor: Theme.of(context).cardTheme.color),
      debugShowCheckedModeBanner: false,
      initialRoute: initUrl,
      routes: routes,
    );
  }
}
