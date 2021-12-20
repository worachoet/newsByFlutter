import 'package:flutter/material.dart';

class CategoryFragment extends StatefulWidget {
  const CategoryFragment({ Key? key }) : super(key: key);

  @override
  _CategoryFragmentState createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Category'),
    );
  }
}