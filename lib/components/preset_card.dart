import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';
import 'package:preset_app/components/primary_button.dart';
import 'package:preset_app/screens/use_preset_screen.dart';

import '../constants.dart';
import 'before_after_stack.dart';

class PresetCard extends StatelessWidget {
  static const height = 600.0;
  static const width = 500.0;
  static const imageWidth = 360.0;

  final String title;
  final String description;
  final Color colorAfter;
  final BlendMode blendModeAfter;

  const PresetCard(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.colorAfter,
      @required this.blendModeAfter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: height,
      width: width,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: kPresetCardTextStyle,
            ),
          ),
          BeforeAfterStack(
            imageHeight: 400,
            afterFilterColor: colorAfter,
            afterBlendMode: blendModeAfter,
          ),
          Text(
            description,
            style: kPresetCardTextStyle.copyWith(
                fontSize: 16, color: kPrimaryColor2),
          ),
          Align(
            alignment: Alignment.center,
            child: PrimaryButton(
              width: width,
              onPressed: () {
                Navigator.pushNamed(context, UsePresetScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
