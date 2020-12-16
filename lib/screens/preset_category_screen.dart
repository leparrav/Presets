import 'package:flutter/material.dart';
import 'package:preset_app/components/preset_card.dart';
import 'package:preset_app/constants.dart';

class PresetCategoryScreen extends StatelessWidget {
  static String id = 'PresetCategoryScreen';
  final String categorySelected;

  const PresetCategoryScreen({Key key, this.categorySelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
            image: AssetImage('images/$categorySelected.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            PresetCard(),
            PresetCard(),
            PresetCard(),
            PresetCard(),
            PresetCard(),
            PresetCard(),
          ],
        ),
      ),
    );
  }
}
