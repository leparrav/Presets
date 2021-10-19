import 'package:flutter/material.dart';
import 'package:preset_app/app.localization.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/screens/choose_image_screen.dart';
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

Widget buildCategoriesRow(context, index) {
  var values = kCategories.values;
  var category = values[index];

  String localizedTitle = AppLocalizations.of(context)
      .translate(category.toShortString().toUpperCase());

  return CategoryCard(value: category, localizedTitle: localizedTitle);
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.value,
    @required this.localizedTitle,
  }) : super(key: key);

  final kCategories value;
  final String localizedTitle;

  @override
  Widget build(BuildContext context) {
    List<kCategories> blackLetters = [
      kCategories.WINTER,
      kCategories.SUMMER,
      kCategories.INTERIOR,
      kCategories.TEA,
      kCategories.BABIES
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageChooserScreen(),
          ),
        );
      },
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 6.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Image(
              width: 100,
              image: AssetImage(
                  'assets/images/categories/${value.toShortString()}.jpg')),
        ),
        Positioned(
          bottom: 20,
          child: Text(localizedTitle,
              style: blackLetters.contains(value)
                  ? kCategoryCardTextStyle.copyWith(
                      color: Colors.black, backgroundColor: Color(0x4DFFFFFF))
                  : kCategoryCardTextStyle),
        ),
      ]),
    );
  }
}

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
      ),
      itemCount: kCategories.values.length,
      itemBuilder: (context, index) {
        return buildCategoriesRow(context, index);
      },
    );
  }
}
