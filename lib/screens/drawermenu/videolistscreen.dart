// ignore_for_file: file_names

import 'package:flutter/material.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({ Key? key }) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.white,
        title: Text(
          'videolist',
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