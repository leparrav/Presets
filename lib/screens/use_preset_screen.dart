import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset_app/components/before_after_stack.dart';
import 'package:preset_app/components/preset_info.dart';
import 'package:preset_app/components/primary_button.dart';

import '../constants.dart';

class UsePresetScreen extends StatefulWidget {
  static String id = 'UsePresetScreen';
  final List<double> colorMatrix;

  const UsePresetScreen({Key key, @required this.colorMatrix})
      : super(key: key);

  @override
  _UsePresetScreenState createState() => _UsePresetScreenState();
}

dynamic loadJson(kCategories categorySelected) async {
  String data = '';
  data = await rootBundle.loadString(
      'assets/data/cards_info_${categorySelected.toShortString()}.json');
  var jsonResult = json.decode(data);
  return jsonResult;
}

class _UsePresetScreenState extends State<UsePresetScreen> {
  List<Widget> portraitImages = [];

  void buildPresetFiltersPortraits() async {
    // TODO: Pass the right category
    kCategories selected = kCategories.PORTRAIT;

    List<Widget> listOfPortraits = [];

    var data = await loadJson(selected);
    var dataList = data as List;

    List<PresetInfo> presetInfoList =
        dataList.map<PresetInfo>((json) => PresetInfo.fromJson(json)).toList();

    for (PresetInfo item in presetInfoList) {
      ClipRRect portrait = ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(item.colorMatrix),
          child: Image(
            image: AssetImage(
                'assets/images/${selected.toShortString()}/${item.sampleImage}'),
          ),
        ),
      );

      listOfPortraits.add(portrait);
      listOfPortraits.add(
        SizedBox(
          width: 20.0,
        ),
      );
    }

    setState(() {
      portraitImages = listOfPortraits;
    });
  }

  @override
  void initState() {
    super.initState();
    buildPresetFiltersPortraits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            BeforeAfterStack(
              imageHeight: 500,
              colorMatrix: widget.colorMatrix,
            ),
            SizedBox(height: 30.0),
            Container(
              height: 70.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: portraitImages,
              ),
            ),
            SizedBox(height: 20.0),
            PrimaryButton(width: 300)
          ],
        ),
      ),
    );
  }
}
