import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset_app/components/preset_card.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/components/preset_info.dart';
import 'package:preset_app/screens/use_preset_screen.dart';

dynamic loadJson(kCategories categorySelected) async {
  String data = '';
  data = await rootBundle.loadString(
      'assets/data/cards_info_${categorySelected.toShortString()}.json');
  var jsonResult = json.decode(data);
  return jsonResult;
}

class PresetCategoryScreen extends StatefulWidget {
  static String id = 'PresetCategoryScreen';
  final kCategories categorySelected;

  const PresetCategoryScreen({Key key, this.categorySelected})
      : super(key: key);

  @override
  _PresetCategoryScreenState createState() => _PresetCategoryScreenState();
}

class _PresetCategoryScreenState extends State<PresetCategoryScreen> {
  List<Widget> cards = [];

  buildPresetCards() async {
    List<PresetCard> widgetList = List<PresetCard>();
    var data = await loadJson(widget.categorySelected);
    var dataList = data as List;

    List<PresetInfo> presetInfoList =
        dataList.map<PresetInfo>((json) => PresetInfo.fromJson(json)).toList();

    for (PresetInfo item in presetInfoList) {
      PresetCard card = PresetCard(
        description: item.description,
        title: item.title,
        colorMatrix: item.colorMatrix,
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return UsePresetScreen(
                colorMatrix: item.colorMatrix,
              );
            }),
          );
        },
      );
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

  _PresetCategoryScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/categories/${widget.categorySelected.toShortString()}.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(padding: const EdgeInsets.all(20), children: cards),
      ),
    );
  }
}
