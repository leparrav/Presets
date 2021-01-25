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
  final kCategories categorySelected;

  const UsePresetScreen(
      {Key key, @required this.colorMatrix, this.categorySelected})
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
  List<double> appliedFilter = [];

  void buildPresetFiltersPortraits(kCategories selected) async {
    List<Widget> listOfPortraits = [];

    var data = await loadJson(selected);
    var dataList = data as List;

    List<PresetInfo> presetInfoList =
        dataList.map<PresetInfo>((json) => PresetInfo.fromJson(json)).toList();

    for (PresetInfo item in presetInfoList) {
      ClipRRect portrait = ClipRRect(
        borderRadius: BorderRadius.circular(300.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(item.colorMatrix),
          child: Image(
            height: 100,
            image: AssetImage(
                'assets/images/${selected.toShortString()}/${item.sampleImage}'),
          ),
        ),
      );

      Column column = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.title,
            style: kPresetCardTextStyle.copyWith(fontSize: 10.0),
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  appliedFilter = item.colorMatrix;
                });
              },
              child: portrait)
        ],
      );

      listOfPortraits.add(
        column,
      );
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
    appliedFilter = widget.colorMatrix;
    buildPresetFiltersPortraits(widget.categorySelected);
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
              colorMatrix: appliedFilter,
            ),
            SizedBox(height: 30.0),
            Container(
              height: 120.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: portraitImages,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(label: 'See all', width: 120),
                PrimaryButton(width: 160),
              ],
            )
          ],
        ),
      ),
    );
  }
}
