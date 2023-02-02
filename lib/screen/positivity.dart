import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class PositivityQuotes extends StatefulWidget {
  const PositivityQuotes({super.key});

  @override
  State<PositivityQuotes> createState() => _PositivityQuotesState();
}

class _PositivityQuotesState extends State<PositivityQuotes> {
  List<String> positivityQuotesList = [
    "The gift of fantasy has meant more to me than my talent for absorbing positive knowledge.",
    "Food has always brought me comfort and the bingeing is triggered when I'm in a space that is not positive.",
    "Chaotic people have chaotic lives, and i think they create that. But if you try and have an inner peace and a positive attitude. I think you crack that.",
    "Anything negative that happen to you life can be turned into a positive as far as acting is concerned. You can draw on your experiences-it's far better than any research.",
    "If you just want positive emotions, our spices would have died out a long time.",
    "Every person get negative thing , they learn from those negative things, and you become a positive person",
    "If we're stuck with having expectations, there's a good reason to embrace positive ones: It is that we often create what we anticipate.",
    "Why should conservations have a positive interest in... farming? There are allot of reasons, but the plainest is: Conservations eat",
    "Once you replace positive thoughts with positive ones, you w'll start having positive results.",
    "There are allot of perks that come with frame, and with every positive there's a negative , and then it all kind of balances out.",
    "Yesterday is not ours to recover, but tomorrow is ours to win or lose.",
    "Work hard for what you want because it won't come to you without a fight. You have to be strong and courageous and know that you have to be strong and courageous and know that you can do anything you put your mind to . If somebody puts you down or criticizes you, just keep on believing in yourself and turn it into something positive.",
    "The most positive step is to try expand the employment base by making it, if not economically friendly, at least not economically disastrous, for studios to take on deficits.",
    "The patient that goes with the game, the little things that go along with the game, you have so much more time to think in golf than you do in football- you have keep your thoughts positive. I'm not sure I've got that mastered.",
    "You've done it before and can do it now. See the positive possibilities. Redirect the substantial energy of your frustration and turn it into positive, effective and unstoppable determination.",
    "An external electric field, meeting it and passing through it, affects the negative mush as the positive quanta of the atom, and pushes the former to one side, and the latter in the other direction.",
    "You don't need to invade a place or install a new government to help bring about a positive change.",
    "To succeed, you need to find something to hold on to, something to motivate you, something to inspire you.",
    "Skillful conservationists can explore disagreements and make points in ways that feel constructive and positive rather than combative or corrective.",
    "I believe if you keep your faith, you keep your trust, you keep the right attitude, if you're grateful, you'll see God open up new doors.",
    "Kant introduced the concept of the negative into philosophy. Would it not also be worthwhile to try to introduce the concept of the positive into philosophy?",
    "If we just wanted positive emotions, our species would have died out a long time ago.",
    "Food has always brought me comfort and the bingeing is triggered when I’m in a space that is not positive.",
    "I think we pursue positive relationships whether or not they bring us engagement or happiness.",
    "There are no plans that always work in life. The secret to happiness is being positive and looking at the brighter side of my life.",
    "Why should conservationists have a positive interest in… farming? There are lots of reasons, but the plainest is: Conservationists eat.",
    "Social distance makes it all the easier to focus on small differences between groups and to put a negative spin on the ways of others and a positive spin on our own.",
    "I’d try to channel my nervous energy in a positive way into strength and endurance. It didn’t always work.",
    "I’m a big advocate of the power of positive thinking, particularly for small businesses.",
    "Positive thinking will let you do everything better than negative thinking will.",
    "I believe if you keep your faith, you keep your trust, you keep the right attitude, if you’re grateful, you’ll see God open up new doors.",
    "An external electric field, meeting it and passing through it, affects the negative as much as the positive quanta of the atom, and pushes the former to one side, and the latter in the other direction.",
    "Every person gets negative things, they learn from those negative things, and you become a positive person.",
    "There are a lot of perks that come with fame, and with every positive there’s a negative, and then it all kind of balances out",
    "Positive market incentives operating in the public interest are too few and far between, and are also up against a seemingly never-ending expansion of perverse incentives and lobbying.",
    "I influence people, hopefully on the positive side.",
    "The thing that lies at the foundation of positive change, the way I see it, is service to a fellow human being.",
    "It’s amazing how a competitive nature can turn a negative into something positive.",
    "You’ve done it before and you can do it now. See the positive possibilities. Redirect the substantial energy of your frustration and turn it into positive, effective, unstoppable determination.",
    "One thing that hasn’t changed, though, is that we still have to hear the new ad 2 or 3 times before it begins to affect us, even when we’re already familiar with the advertiser in question and have a positive opinion of them.",
    "Sometimes you have got to look at things really positively – without putting your head in the sand, you have got to manage the negatives and keep putting a positive slant on it, keep trying to find answers.",
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
          backgroundColor: Colors.black26,
          centerTitle: true,
          title: const Text(
            'Positivity Quotes',
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
                itemCount: positivityQuotesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, positivityQuotesList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            positivityQuotesList[index],
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

  showDialogBox(content, positivityQuotesList) => Get.defaultDialog(
        content: Text(
          positivityQuotesList,
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
                  await Share.share(positivityQuotesList);
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
