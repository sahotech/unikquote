import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class InspirationaldQuotes extends StatefulWidget {
  const InspirationaldQuotes({super.key});

  @override
  State<InspirationaldQuotes> createState() => _InspirationaldQuotes();
}

class _InspirationaldQuotes extends State<InspirationaldQuotes> {
  List<String> inspirationQuotesList = [
    "Put your hand on a hot stove for a minute, and it seems like an hour. Sit with a pretty girl for an hour, and it seems like a minute. That's relativity.",
    "Don't go around saying the world owes you a living. The world owes you nothing. It was here first.",
    "Families are like fudge... mostly sweet with a few nuts.",
    "If at first you don't succeed, think how many people you've made happy.",
    "Families are like fudge... mostly sweet with a few nuts.",
    "Success is simply a matter of luck. Ask any failure.",
    "Those are my principles, and if you don't like them... well, I have others.",
    "Men, chocolate, and coffee are all better rich.",
    "I believe in the discipline of silence, and could talk for hours about it.",
    "The single biggest problem in communication is the illusion that it has taken place.",
    "A verbal contract isn't worth the paper it is written on.",
    "I am not afraid of death, I just don't want to be there when it happens.",
    "Money is better than poverty, if only for financial reasons.",
    "Love is the answer, but while you're waiting for the answer, sex raises some pretty interesting questions.",
    "There has been much tragedy in my life; at least half of it actually happened.",
    "A person without a sense of human is like a wagon without springs -- jolted by every pebble in the road.",
    "Silent gratitude isn't much use to anyone.",
    "I had the blues because I had no shoes until upon the street, I met a man who had no feet.",
    "You can learn many things from children. How much patience you have, for instance.",
    "What you do speaks so loud that I cannot hear what you say.",
    "Some cause happiness wherever they go; others whenever they go.",
    "I wish people who have trouble communicating would just shut up.",
    "I find television very educational. Every time someone turns it on, I go in the other room and read a book.",
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
          backgroundColor: Colors.black38,
          centerTitle: true,
          title: const Text(
            'Inspirational Quotes',
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
                itemCount: inspirationQuotesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, inspirationQuotesList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            inspirationQuotesList[index],
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

  showDialogBox(content, inspirationQuotesList) => Get.defaultDialog(
        content: Text(
          inspirationQuotesList,
          style: GoogleFonts.abel(
            fontSize: 18,
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
                  await Share.share(inspirationQuotesList);
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
