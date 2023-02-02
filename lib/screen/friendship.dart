import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class FriendshipQuotes extends StatefulWidget {
  const FriendshipQuotes({super.key});

  @override
  State<FriendshipQuotes> createState() => _FriendshipQuotesState();
}

class _FriendshipQuotesState extends State<FriendshipQuotes> {
  List<String> friendship = [
    "Anything is possible when you have the right people there to support you.",
    "Share your smile with the world. It's a symbol of friendship and peace. - Christie Brinkley A sweet friendship refreshes the soul",
    "Try to be a rainbow in someone's cloud.",
    "In the cookie of life, friends are the chocolate chips.",
    "Many people will walk in and out of your life, but only true friends will leave footprints in your heart"
        "There are friends, there is family, and then there are friends that become family.",
    "Good friends are like stars. You don't always see them, but you know they're always there.",
    "I would rather walk with a friend in the dark, than alone in the light.",
    "A good friend is like a four-leaf clover: hard to find and lucky to have.",
    "There is nothing I would not do for those who are really my friends.",
    "True friends are always together in spirit.",
    "It's not what we have in life, but who we have in our life that matters",
    "True friends are never apart, maybe in distance but never in heart.",
    "It's the friends you can call up at 4 a.m. that matter.",
    "Surround yourself with only people who are going to lift you higher.",
    "The only way to have a friend is to be one.",
    "Friendship is when people know all about you but like you anyway.",
    "A friend is someone who understands your past, believes in your future, and accepts you just the way you are",
    "Be slow to fall into friendship; but when thou art in, continue firm & constant",
    "Truly great friends are hard to find, difficult to leave, and impossible to forget",
    "Friendship is the golden thread that ties the heart of all the world.",
    "Rare as is true love, true friendship is rare.",
  ];

  late bool _isLoading;
  BannerAd? _banner;
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _createBannerAd();
    _createInterstitialAd();

    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId,
      listener: AdMobService.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;
    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        Get.back();
        _interstitialAd.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        _interstitialAd.dispose();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_isAdLoaded) {
          _interstitialAd.show();
        }
        throw UnsupportedError('Unsupported platform');
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          centerTitle: true,
          title: const Text(
            'Frindship Quotes',
            style: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
        body: _isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: const [
                      Skelton(),
                      SizedBox(height: 20),
                      Skelton(),
                      SizedBox(height: 20),
                      Skelton(),
                      SizedBox(height: 20),
                      Skelton(),
                      SizedBox(height: 20),
                      Skelton(),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: friendship.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, friendship[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            friendship[index],
                            style: GoogleFonts.abel(
                              fontSize: 18,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
        bottomNavigationBar: _banner == null
            ? Container()
            : Container(
                margin: const EdgeInsets.only(bottom: 12),
                height: 52,
                child: AdWidget(ad: _banner!),
              ),
      ),
    );
  }

  showDialogBox(content, friendship) => Get.defaultDialog(
        content: Text(
          friendship,
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        title: "",
        titleStyle: const TextStyle(color: Colors.brown),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  await Share.share(friendship);
                },
                child: const Text(
                  'Share',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
