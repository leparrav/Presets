import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get() {
    return Platform.isAndroid
        ? 'ca-app-pub-6315239830176663/2922920856'
        : 'ca-app-pub-3940256099942544/2934735716';
  }

  String getInterstitial() {
    return Platform.isAndroid
        ? 'ca-app-pub-6315239830176663/8050494530'
        : 'ca-app-pub-3940256099942544/4411468910';
  }

  AdListener get adListener => _adListener;

  AdListener _adListener = AdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => print('Ad closed.'),
    // Called when an ad is in the process of leaving the application.
    onApplicationExit: (Ad ad) => print('Left application.'),
  );
}
