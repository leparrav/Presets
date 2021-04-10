import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preset_app/components/before_after_stack.dart';
import 'package:preset_app/components/preset_info.dart';
import 'package:preset_app/screens/confirm_screen.dart';
import 'package:provider/provider.dart';

import '../ad_state.dart';
import '../app.localization.dart';
import '../constants.dart';

class UsePresetScreen extends StatefulWidget {
  static String id = 'UsePresetScreen';
  final List<double> colorMatrix;
  final String categorySelected;

  const UsePresetScreen(
      {Key key, @required this.colorMatrix, this.categorySelected})
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
  final picker = ImagePicker();
  File _image;
  bool imageSelected = false;
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

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imageSelected = true;
        buildPresetFiltersPortraits();
      } else {
        print('No image selected.');
      }
    });
  }

  void buildPresetFiltersPortraits() async {
    List<Widget> listOfPortraits = [];

    var data = await loadJson(widget.categorySelected);
    var dataList = data as List;

    List<PresetInfo> presetInfoList =
        dataList.map<PresetInfo>((json) => PresetInfo.fromJson(json)).toList();

    for (PresetInfo item in presetInfoList) {
      ClipRRect portrait = ClipRRect(
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(item.colorMatrix),
          child: Image(
            height: 80,
            image: FileImage(_image),
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
    }

    setState(() {
      portraitImages = listOfPortraits;
    });
  }

  @override
  void initState() {
    super.initState();
    appliedFilter = widget.colorMatrix;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: !imageSelected
            ? SimpleDialog(children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('CAMERA'),
                      ),
                      Icon(Icons.camera_alt_outlined),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('GALLERY'),
                      ),
                      Icon(Icons.add_photo_alternate_outlined),
                    ],
                  ),
                )
              ])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BeforeAfterStack(
                      imageHeight: 450,
                      colorMatrix: appliedFilter,
                      imageSelected: _image),
                  SizedBox(height: 20.0),
                  Container(
                    height: 120.0,
                    child: ListView(
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
                            imageSelected = false;
                          });
                        },
                        color: Colors.white,
                        icon: Icon(Icons.camera_alt_outlined),
                        label: Text(
                          AppLocalizations.of(context)
                              .translate('CHANGE_PICTURE'),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          saveInterstitial.show();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ConfirmScreen(
                                image: _image,
                                colorFilterMatrix: appliedFilter,
                              );
                            }),
                          );
                        },
                        color: Colors.white,
                        icon: Icon(Icons.arrow_forward),
                        label: Text(
                          AppLocalizations.of(context).translate('CONTINUE'),
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
