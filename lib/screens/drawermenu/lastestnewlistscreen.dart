import 'package:flutter/material.dart';
import 'package:newsflutter/Theme/colors.dart';

class LastestNewListScreen extends StatefulWidget {
  const LastestNewListScreen({Key? key}) : super(key: key);

  @override
  _LastestNewListScreenState createState() => _LastestNewListScreenState();
}

class _LastestNewListScreenState extends State<LastestNewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.white,
        title: Text(
          'Lastest News',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text('Content'),
      ),
    );
  }
}
