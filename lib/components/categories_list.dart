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

void buildCategoriesRow1(context, List<Widget> categories) {
  for (var value in kCategories.values) {
    String localizedTitle = AppLocalizations.of(context)
        .translate(value.toShortString().toUpperCase());

    categories.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsePresetScreen(
                  colorMatrix: kIdentityColorMatrix,
                  categorySelected: value,
                ),
              ),
            );
          },
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Image(
                height: 500,
                image: AssetImage(
                    'assets/images/categories/${value.toShortString()}.jpg')),
            Positioned(
              bottom: 20,
              child: Text(localizedTitle,
                  style: value == kCategories.WINTER
                      ? kCategoryCardTextStyle.copyWith(color: Colors.black)
                      : kCategoryCardTextStyle),
            ),
          ]),
        ),
      ),
    );
    categories.add(
      SizedBox(height: kContainerHeight, width: 10.0),
    );
  }
}

void buildCategoriesRow2(context, List<Widget> categories) {
  for (var value in kCategories.values) {
    String localizedTitle = AppLocalizations.of(context)
        .translate(value.toShortString().toUpperCase());

    categories.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsePresetScreen(
                  colorMatrix: kIdentityColorMatrix,
                  categorySelected: value,
                ),
              ),
            );
          },
          child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Image(
                height: 500,
                image: AssetImage(
                    'assets/images/categories/${value.toShortString()}.jpg')),
            Positioned(
              bottom: 20,
              child: Text(localizedTitle,
                  style: value == kCategories.WINTER
                      ? kCategoryCardTextStyle.copyWith(color: Colors.black)
                      : kCategoryCardTextStyle),
            ),
          ]),
        ),
      ),
    );
    categories.add(
      SizedBox(height: kContainerHeight, width: 10.0),
    );
  }
}

List<Widget> setCategoriesImages(context, int categoryRow) {
  List<Widget> categories = [];
  if (categoryRow == 1) {
    buildCategoriesRow1(context, categories);
  }
  return categories;
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
    return Container(
      margin: EdgeInsets.all(kContainerPadding),
      color: Colors.blueAccent,
      child: Material(
        color: kPrimaryColor1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.only(bottom: 10),
              child: ListView(
                children: setCategoriesImages(context, 1),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              height: 300,
              child: ListView(
                children: setCategoriesImages(context, 2),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10),
            banner == null
                ? SizedBox(height: 100.0)
                : Container(
                    height: 100,
                    width: 320,
                    child: AdWidget(ad: banner),
                  ),
          ],
        ),
      ),
    );
  }
}
