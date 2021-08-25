import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:preset_app/app.localization.dart';
import 'package:preset_app/constants.dart';
import 'package:preset_app/screens/preset_category_screen.dart';
import 'package:preset_app/screens/use_preset_screen.dart';
import 'package:provider/provider.dart';

import '../ad_state.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UsePresetScreen(
              colorMatrix: kIdentityColorMatrix,
              categorySelected: value.toShortString(),
            ),
          ),
        );
      },
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Image(
            width: 100,
            image: AssetImage(
                'assets/images/categories/${value.toShortString()}.jpg')),
        Positioned(
          bottom: 20,
          child: Text(localizedTitle,
              style: value == kCategories.WINTER
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
  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
            size: AdSize.fullBanner,
            adUnitId: adState.get(),
            listener: adState.adListener,
            request: AdRequest())
          ..load();
      });
    });
  }

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
