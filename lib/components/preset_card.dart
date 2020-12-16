import 'package:flutter/material.dart';

import '../constants.dart';

class PresetCard extends StatelessWidget {
  static const cardHeight = 390.0;
  static const cardWidth = 360.0;
  static const imageWidth = 350.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: cardHeight,
      width: cardWidth,
      color: Colors.black87,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Faded & green',
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
            'imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum varius sit amet mattis vulputate',
            style: kPresetCardTextStyle.copyWith(fontSize: 12),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(top: 5.0),
              width: cardWidth / 3,
              height: 40.0,
              color: kPrimaryColor1,
              child: Text('Use this filter ->'),
            ),
          ),
        ],
      ),
    );
  }
}
