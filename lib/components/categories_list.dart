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

List<Widget> setCategoriesImages(context) {
  List<Widget> categories = [];

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
            Image.asset(
                'assets/images/categories/${value.toShortString()}.jpg'),
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
            size: AdSize.banner,
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
      height: kContainerHeight,
      color: Colors.blueAccent,
      child: Material(
        color: kPrimaryColor1,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: setCategoriesImages(context),
                scrollDirection: Axis.horizontal,
              ),
            ),
            if (banner == null)
              SizedBox(height: 50.0)
            else
              Container(
                height: 50,
                child: AdWidget(ad: banner),
              ),
          ],
        ),
      ),
    );
  }
}
