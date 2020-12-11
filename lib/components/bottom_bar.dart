import 'package:flutter/material.dart';
import '../constants.dart';

List<BottomNavigationBarItem> homeItems = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: kPrimaryColor3,
    ),
    title: Text('Home'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.business),
    title: Text('Business'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    title: Text('Favorite'),
  ),
];

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kPrimaryColor4,
      items: homeItems,
    );
  }
}
