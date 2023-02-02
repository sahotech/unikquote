import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class HappinessQuotes extends StatefulWidget {
  const HappinessQuotes({super.key});

  @override
  State<HappinessQuotes> createState() => _HappinessQuotesState();
}

class _HappinessQuotesState extends State<HappinessQuotes> {
  List<String> happinessQuotesList = [
    "Happiness makes up in height for what it lacks in length..",
    "Plenty of people miss their share of happiness, not because they never found it, but because they didn’t stop to enjoy it.",
    "Lovers who love truly do not write down their happiness.",
    "In times of joy, all of us wished we possessed a tail we could wag.",
    "Lovers who love truly do not write down their happiness.",
    "If your happiness depends on what somebody else does, I guess you do have a problem.",
    "Happiness is that state of consciousness which proceeds from the achievement of one’s values.",
    "The two enemies of human happiness are pain and boredom.",
    "A table, a chair, a bowl of fruit and a violin; what else does a man need to be happy?",
    "The happiness of a man in this life does not consist in the absence but in the mastery of his passions.",
    "Happiness  depend on self-discipline. We are the biggest obstacles to our own happiness. It is much easier to do battle with society and with others than to fight our own nature.",
    "A hug is like a boomerang – you get it back right away.",
    "Happiness can only be found if you can free yourself of all other distractions.",
    "Happiness never lays its finger on its pulse.",
    "There is only one way to happiness and that is to cease worrying about things which are beyond the power of our will.",
    "A happy life must be to a great extent a quiet life, for it is only in an atmosphere of quiet that true joy dare live.",
    "A happy life must be to a great extent a quiet life, for it is only in an atmosphere of quiet that true joy dare live.",
    "Happiness isn’t something you experience; it’s something you remember.",
    "Satisfaction of one’s curiosity is one of the greatest sources of happiness in life.",
    "There are people who can do all fine and herotic things but one – keep from telling their happiness to the unhappy.",
    "If you wait for the perfect moment when all is safe and assured, it may never arrive. Mountains will not be climbed, races won, or lasting happiness achieved.",
    "Happy he who learns to bear what he cannot change.",
    "Action may not always bring happiness; but there is no happiness without action",
    "Happiness exists on earth, and it is won through prudent exercise of reason, knowledge of the harmony of the universe, and constant practice of generosity.",
    "All happiness or unhappiness solely depends upon the quality of the object to which we are attached by love.",
    "Happiness is not a goal; it is a by-product.",
    "The happiness of most people is not ruined by great catastrophes or fatal errors, but by the repetition of slowly destructive little things",
    "To attain happiness in another world we need only to believe something, while to secure it in this world we must do something.",
    "In order to have great happiness you have to have great pain and unhappiness – otherwise how would you know when you’re happy?",
    "It is neither wealth nor splendor; but tranquility and occupation which give you happiness.",
    "You must try to generate happiness within yourself. If you aren’t happy in one place, chances are you won’t be happy anyplace.",
    "Happiness is spiritual, born of truth and love. It is unselfish; therefore it cannot exist alone, but requires all mankind to share it.",
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
          backgroundColor: Colors.purple.shade200,
          centerTitle: true,
          title: const Text(
            'Happiness Quotes',
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
                itemCount: happinessQuotesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, happinessQuotesList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            happinessQuotesList[index],
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

  showDialogBox(content, happinessQuotesList) => Get.defaultDialog(
        content: Text(
          happinessQuotesList,
          style: GoogleFonts.abel(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        title: 'Happiness',
        titleStyle: const TextStyle(color: Colors.brown),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  await Share.share(happinessQuotesList);
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
