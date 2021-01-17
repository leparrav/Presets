import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset_app/components/preset_card.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/components/preset_info.dart';

dynamic loadJson(String categorySelected) async {



  String data = await rootBundle.loadString('data/cards_info_portrait.json');
  var jsonResult = json.decode(data);
  return jsonResult;
}



class PresetCategoryScreen extends StatefulWidget {
  static String id = 'PresetCategoryScreen';
  final kCategories categorySelected;

  const PresetCategoryScreen({Key key, this.categorySelected}) : super(key: key);

  @override
  _PresetCategoryScreenState createState() => _PresetCategoryScreenState(categorySelected);
}

class _PresetCategoryScreenState extends State<PresetCategoryScreen> {

  final kCategories categorySelected;
  List<Widget> cards = [];

  buildPresetCards() async {
    List<PresetCard> widgetList = List<PresetCard>();
    var data = await loadJson(categorySelected.toShortString());
    var dataList = data as List;
    List<PresetInfo> presetInfoList = dataList.map<PresetInfo>((json) => PresetInfo.fromJson(json)).toList();
    for (PresetInfo item in presetInfoList){
      PresetCard card = PresetCard(description: item.description, title: item.title,);
      widgetList.add(card);
    }
    setState(() {
      cards = widgetList;
    });
  }

  @override
  initState() {
    super.initState();
    buildPresetCards();
  }

  _PresetCategoryScreenState(this.categorySelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/${categorySelected.toShortString()}.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: cards
        ),
      ),
    );
  }
}