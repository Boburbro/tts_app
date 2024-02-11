import 'package:google_mobile_ads/google_mobile_ads.dart';

class MobileAdsManager {
  static const id = "ca-app-pub-4309572988121078~2682916735";
  static const unitBanner = "ca-app-pub-4309572988121078/8482038327";

  static final BannerAdListener adsListener = BannerAdListener(
    onAdLoaded: (ad) => print("Ad loaded"),
  );
}
