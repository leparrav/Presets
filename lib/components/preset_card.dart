import 'package:flutter/material.dart';

import '../constants.dart';

class PresetCard extends StatelessWidget {
  static const cardHeight = 390.0;
  static const cardWidth = 360.0;
  static const imageWidth = 360.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: cardHeight,
      width: cardWidth,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'FADED & GREEN',
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
            'imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada',
            style: kPresetCardTextStyle.copyWith(fontSize: 16),
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: cardWidth,
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
