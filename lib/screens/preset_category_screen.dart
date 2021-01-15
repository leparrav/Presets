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
  return list;
}

class PresetCategoryScreen extends StatefulWidget {
  static String id = 'PresetCategoryScreen';
  final String categorySelected;

  const PresetCategoryScreen({Key key, this.categorySelected}) : super(key: key);

  @override
  _PresetCategoryScreenState createState() => _PresetCategoryScreenState(categorySelected);
}

class _PresetCategoryScreenState extends State<PresetCategoryScreen> {

  final String categorySelected;

  @override
  initState() {
    super.initState();
    loadJson();
  }

  _PresetCategoryScreenState(this.categorySelected);

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