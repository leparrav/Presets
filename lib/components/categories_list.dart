
import 'package:flutter/material.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/screens/preset_category_screen.dart';

const kContainerPadding = 20.0;
const kContainerHeight = 500.0;

kCategories getSelectedCategory(String imagePath) {
  switch (imagePath) {
    case 'images/enPagePortrait.jpg':
      return kCategories.PORTRAIT;
    case 'images/enPageKids.jpg':
      return kCategories.KIDS;
    case 'images/enPageTravel.jpg':
      return kCategories.TRAVEL;
    case 'images/enPageNature.jpg':
      return kCategories.NATURE;
    case 'images/enPageWinter.jpg':
      return kCategories.WINTER;
    default:
      return kCategories.PORTRAIT;
  }
}

void navigateToCategory(context, kCategories categorySelected) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PresetCategoryScreen(
        categorySelected: categorySelected,
      ),
    ),
  );
}

List<Widget> setCategoriesImages(context) {
  List<Widget> categories = [];
  for (var imagePath in kPresetCategories) {
    categories.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {
            navigateToCategory(context, getSelectedCategory(imagePath));
          },
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
