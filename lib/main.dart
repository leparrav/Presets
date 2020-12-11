import 'package:flutter/material.dart';
import 'package:preset_app/screens/main_screen.dart';

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
      },
      home: MainScreen(),
    );
  }
}
