import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1609945510511354/5347790984';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1609945510511354/3911420383";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    }
    throw UnsupportedError('Unsupported platform');
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('Ad loaded'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    onAdOpened: (ad) => debugPrint('Ad opened'),
    onAdClosed: (ad) => debugPrint('Ad closed'),
  );
}
