import 'package:flutter/material.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  _SearchFragmentState createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
