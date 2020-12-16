import 'package:flutter/material.dart';
import '../constants.dart';

List<BottomNavigationBarItem> homeItems = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: kPrimaryColor1,
    ),
    title: Text(
      'Home',
      style: TextStyle(color: kPrimaryColor1),
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.favorite,
      color: kPrimaryColor1,
    ),
    title: Text(
      'Favorites',
      style: TextStyle(color: kPrimaryColor1),
    ),
  ),
];

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: homeItems,
    );
  }
}
