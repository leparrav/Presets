
import 'package:flutter/material.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/screens/preset_category_screen.dart';

const kContainerPadding = 20.0;
const kContainerHeight = 500.0;

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
  for (var value in kCategories.values) {
    categories.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {
            navigateToCategory(context, value);
          },
          child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.asset('assets/images/categories/${value.toShortString()}.jpg'),
                Positioned(
                    bottom: 20,
                    child: Text(value.toShortString(), style: kCategoryCardTextStyle)),
              ]
          ),
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
