import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:preset_app/components/before_after_stack.dart';
import 'package:preset_app/components/preset_info.dart';
import 'package:preset_app/screens/confirm_screen.dart';
import 'package:provider/provider.dart';

import '../ad_state.dart';
import '../app.localization.dart';
import '../constants.dart';

class UsePresetScreen extends StatefulWidget {
  static String id = 'UsePresetScreen';
  final File image;
  final List<double> colorMatrix;
  final String categorySelected;

  const UsePresetScreen(
      {Key key,
      @required this.image,
      @required this.colorMatrix,
      this.categorySelected})
      : super(key: key);

  @override
  _UsePresetScreenState createState() => _UsePresetScreenState();
}

dynamic loadJson(String categorySelected) async {
  String data = '';
  data = await rootBundle
      .loadString('assets/data/cards_info_${categorySelected}.json');
  var jsonResult = json.decode(data);
  return jsonResult;
}

class _UsePresetScreenState extends State<UsePresetScreen> {
  List<Widget> portraitImages = [];
  List<double> appliedFilter = [];
  final scrollController = ScrollController();
  BannerAd banner;
  InterstitialAd saveInterstitial;

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

        saveInterstitial = InterstitialAd(
          adUnitId: adState.getInterstitial(),
          request: AdRequest(),
          listener: AdListener(),
        )..load();
      });
    });
  }

  void buildPresetFiltersPortraits() async {
    List<Widget> listOfPortraits = [];

    var data = await loadJson(widget.categorySelected);
    var dataList = data as List;

    List<PresetInfo> presetInfoList =
        dataList.map<PresetInfo>((json) => PresetInfo.fromJson(json)).toList();

    int i = 1;
    for (PresetInfo item in presetInfoList) {
      int portraitIndex = i;
      ClipRRect portrait = ClipRRect(
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(item.colorMatrix),
          child: Image(
            height: 80,
            image: FileImage(widget.image),
          ),
        ),
      );

      Column column = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.title,
            style: kPresetCardTextStyle.copyWith(fontSize: 10.0),
          ),
          GestureDetector(
              onTap: () {
                scrollController.animateTo(
                  80.0 * portraitIndex,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
                setState(() {
                  appliedFilter = item.colorMatrix;
                });
              },
              child: Container(padding: EdgeInsets.all(10.0), child: portrait)),
        ],
      );

      listOfPortraits.add(
        column,
      );

      i++;
    }

    setState(() {
      portraitImages = listOfPortraits;
    });
  }

  @override
  void initState() {
    super.initState();
    appliedFilter = widget.colorMatrix;
    buildPresetFiltersPortraits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BeforeAfterStack(
                imageHeight: 450,
                colorMatrix: appliedFilter,
                imageSelected: widget.image),
            SizedBox(height: 20.0),
            Container(
              height: 120.0,
              child: ListView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                children: portraitImages,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  color: kPrimaryColor1,
                  icon: Icon(Icons.camera_alt_outlined),
                  label: Text(
                    AppLocalizations.of(context).translate('CHANGE_PICTURE'),
                    style: GoogleFonts.indieFlower().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    var rng = new Random();
                    if (rng.nextDouble() > 0.9) {
                      saveInterstitial.show();
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ConfirmScreen(
                          image: widget.image,
                          colorFilterMatrix: appliedFilter,
                        );
                      }),
                    );
                  },
                  color: kPrimaryColor2,
                  icon: Icon(Icons.arrow_forward),
                  label: Text(
                    AppLocalizations.of(context).translate('CONTINUE'),
                    style: GoogleFonts.indieFlower().copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
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
