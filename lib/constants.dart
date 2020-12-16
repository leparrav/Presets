import 'package:flutter/material.dart';

const kPrimaryColor1 = Color(0xFFf1f1f1);
const kPrimaryColor2 = Color(0xFFfdb827);
const kPrimaryColor3 = Color(0xFF21209c);
const kPrimaryColor4 = Color(0xFF23120B);

const kPresetCardTextStyle = TextStyle(
  color: kPrimaryColor2,
  fontSize: 24,
  fontFamily: 'Lora',
  fontWeight: FontWeight.bold,
);

List<String> kPresetCategories = [
  'images/enPagePortrait.jpg',
  'images/enPageKids.jpg',
  'images/enPageTravel.jpg',
  'images/enPageNature.jpg',
  'images/enPageWinter.jpg',
];

AppBar topBar() {
  return AppBar(
    backgroundColor: Colors.black,
  );
}
