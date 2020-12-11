import 'package:flutter/material.dart';

const kContainerPadding = 20.0;
const kContainerHeight = 400.0;

void setCategoriesImages() {}

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kContainerPadding),
      height: kContainerHeight,
      color: Colors.blueAccent,
      child: ListView(
        children: <Widget>[],
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
