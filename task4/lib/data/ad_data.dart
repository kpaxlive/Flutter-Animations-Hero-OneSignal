import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAd {
  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;
  RewardedAd? rewardedAd;
  int rewardScore = 0;
  Function(int)? rewardScoreChanged;

  GoogleAd({this.rewardScoreChanged});

  void loadAdInterstitial() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/4411468910',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            showInterstitial();
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void showInterstitial() {
    if (interstitialAd != null) {
      interstitialAd!.show();
    } else {
      loadAdInterstitial();
    }
  }

  void showRewardedAd() {
    if (rewardedAd != null) {
      rewardedAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
        rewardScore++;
        rewardScoreChanged?.call(rewardScore); // Notify rewardScore changes
      });
      print("GİRDİ");
    } else {
      print("ELSE GİRDİ");

      loadAdRewarded();
    }
  }

  void loadAdBanner() {
    bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/2934735716',
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadAdRewarded() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1712485313',
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
            showRewardedAd();
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }
}
