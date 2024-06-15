import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_3/data/ad_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleAd googleAd = GoogleAd();

 int _rewardScore = 0;

  @override
  void initState() {
    googleAd.loadAdInterstitial();
    googleAd.loadAdBanner();
    googleAd.rewardScoreChanged = _updateRewardScore; // Assigning callback function
    super.initState();
  }

  // Callback function to update reward score
  void _updateRewardScore(int newScore) {
    setState(() {
      _rewardScore = newScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AdMob"),
      ),
      body: Stack(
        children: [
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      googleAd.loadAdInterstitial();
                    });
                  },
                  child: const Text("See the Interstitial Ad")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                    googleAd.loadAdRewarded();  
                    });
                  },
                  child: const Text("Earn Reward")),
              Text("Current Rewards: ${_rewardScore}"),
            ],
          )),
          if (googleAd.bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: SizedBox(
                  width: googleAd.bannerAd!.size.width.toDouble(),
                  height: googleAd.bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: googleAd.bannerAd!),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
