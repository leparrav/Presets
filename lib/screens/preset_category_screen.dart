import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset_app/components/preset_card.dart';
import 'package:preset_app/constants.dart';

loadJson() async {
  String data = await rootBundle.loadString('data/enPortrait.json');
  var jsonResult = json.decode(data);
  print(jsonResult);
}

List<PresetCard> buildPresetCards() {
  List<PresetCard> list;




}

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
