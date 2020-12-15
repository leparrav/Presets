import 'package:flutter/material.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/screens/preset_category_screen.dart';

const kContainerPadding = 20.0;
const kContainerHeight = 500.0;

void navigateToCategory(context, String path) {
  Navigator.pushNamed(context, PresetCategoryScreen.id);
}

List<Widget> setCategoriesImages(context) {
  final border = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(60.0),
  );
  List<Widget> categories = [];
  for (var imagePath in kPresetCategories) {
    categories.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () => {navigateToCategory(context, imagePath)},
          child: Image.asset(imagePath),
        ),
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
          children: setCategoriesImages(context),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
