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

const kCategoryCardTextStyle = TextStyle(
  color: kPrimaryColor1,
  fontSize: 36,
  fontFamily: 'Lora',
  fontWeight: FontWeight.bold,
);

AppBar topBar() {
  return AppBar(
    backgroundColor: Colors.black,
  );
}

enum kCategories {
  PORTRAIT,
  KIDS,
  TRAVEL,
  NATURE,
  WINTER
}

extension ParseToString on kCategories {
  String toShortString() {
    return this.toString().split('.').last.toLowerCase();
  }
}