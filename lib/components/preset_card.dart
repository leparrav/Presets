import 'package:flutter/material.dart';
import 'package:before_after/before_after.dart';

import '../constants.dart';

class PresetCard extends StatelessWidget {
  static const height = 390.0;
  static const width = 360.0;
  static const imageWidth = 360.0;

  final String title;
  final String description;

  const PresetCard({Key key,@required this.title,@required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: height,
      width: width,
      color: Colors.black,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: AssetImage('images/samplePortrait.jpg'),
              width: imageWidth,
            ),
          ),
          Text(
            description,
            style: kPresetCardTextStyle.copyWith(fontSize: 16),
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: (){},
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: width,
                decoration: BoxDecoration(
                  color: kPrimaryColor1,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Use this preset',
                    style: TextStyle(fontSize: 16, color: kPrimaryColor3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
