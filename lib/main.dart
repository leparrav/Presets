import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:preset_app/screens/main_screen.dart';
import 'package:preset_app/screens/preset_category_screen.dart';
import 'package:provider/provider.dart';

import 'ad_state.dart';
import 'app.localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(value: adState, builder: (context, child) => PresetApp()),
  );
}

class PresetApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light up',
      supportedLocales: [
        Locale('en', ''),
        Locale('es', ''),
        Locale('ro', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeListResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.first.languageCode) {
            return supportedLocale;
          }
        }

        return supportedLocales.first;
      },
      routes: {
        MainScreen.id: (context) => MainScreen(),
        PresetCategoryScreen.id: (context) => PresetCategoryScreen(),
      },
      home: MainScreen(),
    );
  }
}
