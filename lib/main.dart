import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:preset_app/screens/main_screen.dart';
import 'package:preset_app/screens/preset_category_screen.dart';

import 'app.localization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PresetApp());
}

class PresetApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preset App',
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
