import 'package:flutter/material.dart';
import 'package:preset_app/components/bottom_bar.dart';
import 'package:preset_app/components/categories_list.dart';
import 'package:preset_app/components/preset_card.dart';
import '../constants.dart';

class MainScreen extends StatefulWidget {
  static String id = 'MainScreenID';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor1,
      appBar: topBar(),
      body: Material(
        color: kPrimaryColor1,
        child: ListView(
          children: [
            CategoriesList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
