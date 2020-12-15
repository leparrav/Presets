import 'package:flutter/material.dart';
import 'package:preset_app/constants.dart';

class PresetCategoryScreen extends StatelessWidget {
  static String id = 'PresetCategoryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage('images/portrait.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: null,
      ),
    );
  }
}
