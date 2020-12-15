import 'package:flutter/material.dart';
import 'package:preset_app/screens/main_screen.dart';
import 'package:preset_app/screens/preset_category_screen.dart';

void main() {
  runApp(PresetApp());
}

class PresetApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        MainScreen.id: (context) => MainScreen(),
        PresetCategoryScreen.id: (context) => PresetCategoryScreen(),
      },
      home: MainScreen(),
    );
  }
}
