 import 'package:flutter/material.dart';

 class AboutUsScreen extends StatefulWidget {
   const AboutUsScreen({ Key? key }) : super(key: key);
 
   @override
   _AboutUsScreenState createState() => _AboutUsScreenState();
 }
 
 class _AboutUsScreenState extends State<AboutUsScreen> {
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.white,
        title: Text(
          'About',
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