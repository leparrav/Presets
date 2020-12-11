import 'package:flutter/material.dart';
import 'package:preset_app/constants.dart';

const kContainerPadding = 20.0;
const kContainerHeight = 500.0;

List<Widget> setCategoriesImages() {
  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60.0),
  );

  List<String> presetCategoriesImages = [
    'images/enPagePortrait.jpg',
    'images/enPageKids.jpg',
    'images/enPageTravel.jpg',
  ];

  List<Widget> categories = [];
  for (var imagePath in presetCategoriesImages) {
    categories.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(imagePath),
      ),
    );
    categories.add(
      SizedBox(height: kContainerHeight, width: 10.0),
    );
  }

  return categories;
}

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kContainerPadding),
      height: kContainerHeight,
      color: Colors.blueAccent,
      child: Material(
        color: kPrimaryColor1,
        child: ListView(
          children: setCategoriesImages(),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
