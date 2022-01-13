import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mdi/mdi.dart';

const kPrimaryColor1 = Color(0xFFf1f1f1);
const kPrimaryColor2 = Color(0xFFfdb827);
const kPrimaryColor3 = Color(0xFF21209c);
const kPrimaryColor4 = Color(0xFF23120B);

const kPresetCardTextStyle = TextStyle(
  color: kPrimaryColor1,
  fontSize: 24,
  fontFamily: 'Lora',
  fontWeight: FontWeight.bold,
);

const kCategoryCardTextStyle = TextStyle(
    color: kPrimaryColor1,
    fontSize: 14,
    fontFamily: 'Lora',
    fontWeight: FontWeight.bold,
    backgroundColor: Color(0x1A000000));

AppBar topBar(context) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      'Light up',
      style: GoogleFonts.indieFlower().copyWith(fontSize: 32.0),
    ),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.help),
        onPressed: () {
          showAboutDialog(context: context);
        },
      ),
    ],
  );
}

enum kCategories {
  BABIES,
  CATS,
  CITIES,
  DESERT,
  DOGS,
  FALL,
  FOOD,
  FOREST,
  FUTURE,
  HALLOWEEN,
  HAPPY,
  INTERIOR,
  KIDS,
  LAKE,
  LOW_LIGHT,
  MARRIAGE,
  FOREST_MOUNTAIN,
  NATURE,
  NIGHT_MODE,
  PORTRAIT,
  SNOW,
  SPRING,
  STREET_PHOTOGRAPHY,
  SUMMER,
  SUNRISE,
  SUNSET,
  TRAVEL,
  TEA,
  UNDERWATER,
  WINTER
}

extension ParseToString on kCategories {
  String toShortString() {
    return this.toString().split('.').last.toLowerCase();
  }
}

const List<BottomNavigationBarItem> kBottomBarItems = [
  BottomNavigationBarItem(
    icon: Icon(
      Mdi.alphabeticalVariant,
      size: 40.0,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.photo_filter,
      size: 40.0,
    ),
    label: '',
  ),
];

const List<double> kIdentityColorMatrix = [
  1,
  0,
  0,
  0,
  1,
  0,
  1,
  0,
  0,
  1,
  0,
  0,
  1,
  0,
  1,
  0,
  0,
  0,
  1,
  0,
];
