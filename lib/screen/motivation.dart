import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class MotivationalQuotes extends StatefulWidget {
  const MotivationalQuotes({super.key});

  @override
  State<MotivationalQuotes> createState() => _MotivationalQuotesState();
}

class _MotivationalQuotesState extends State<MotivationalQuotes> {
  List<String> motivationQuotesList = [
    "If you want to achieve greatness stop asking for permission.",
    "Things work out best for those who make the best of how things work out.",
    "To live a creative life, we must lose our fear of being wrong",
    "If you are not willing to risk the usual you will have to settle for the ordinary.",
    "Trust because you are willing to accept the risk, not because it's safe or certain.",
    "Take up one idea. Make that one idea your life--think of it, dream of it, live on that idea. Let the brain, muscles, nerves, every part of your body, be full of that idea, and just leave every other idea alone. This is the way to success.",
    "All our dreams can come true if we have the courage to pursue them.",
    "Good things come to people who wait, but better things come to those who go out and get them.",
    "If you do what you always did, you will get what you always got.",
    "Just when the caterpillar thought the world was ending, he turned into a butterfly.",
    "Successful entrepreneurs are givers and not takers of positive energy.",
    "Whenever you see a successful person you only see the public glories, never the private sacrifices to reach them.",
    "Opportunities don't happen, you create them.",
    "Try not to become a person of success, but rather try to become a person of value.",
    "Great minds discuss ideas; average minds discuss events; small minds discuss people.",
    "A man can be as great as he wants to be. If you believe in yourself and have the courage, the determination, the dedication, the competitive drive and if you are willing to sacrifice the little things in life and pay the price for the things that are worthwhile, it can be done.",
    "You may have to fight a battle more than once to win it.",
    "Don't let what you cannot do interfere with what you can do.",
    "Failure is the condiment that gives success its flavor.",
    "Little minds are tamed and subdued by misfortune; but great minds rise above it.",
    "It is better to fail in originality than to succeed in imitation.",
    "Real difficulties can be overcome; it is only the imaginary ones that are unconquerable.",
    "You've got to get up every morning with determination if you're going to go to bed with satisfaction.",
    "There is no chance, no destiny, no fate, that can hinder or control the firm resolve of a determined soul.",
    "Motivation is what gets you started. Habit is what keeps you going.",
    "You must expect great things of yourself before you can do them.",
    "Don't want to get to the end of my life and find that I lived just the length of it. I want to have lived the width of it as well.",
    "In my experience, there is only one motivation, and that is desire. No reasons or principle contain it or stand against it.",
    "The reason most people never reach their goals is that they don't define them, or ever seriously consider them as believable or achievable. Winners can tell you where they are going, what they plan to do along the way, and who will be sharing the adventure with them.",
    "The number one reason people fail in life is because they listen to their friends, family, and neighbors.",
    "Successful people do what unsuccessful people are not willing to do. Don't wish it were easier, wish you were better.",
    "You can't connect the dots looking forward; you can only connect them looking backwards. So you have to trust that the dots will somehow connect in your future. You have to trust in something--your gut, destiny, life, karma, whatever. This approach has never let me down, and it has made all the difference in my life.",
    "If you want to make a permanent change, stop focusing on the size of your problems and start focusing on the size of you!",
    "Don't let the fear of losing be greater than the excitement of winning.",
    "If you genuinely want something, don't wait for it--teach yourself to be impatient.",
    "The function of leadership is to produce more leaders, not more followers.",
    "As we look ahead into the next century, leaders will be those who empower others.",
    "The first step toward success is taken when you refuse to be a captive of the environment in which you first find yourself.",
    "People who succeed have momentum. The more they succeed, the more they want to succeed, and the more they find a way to succeed. Similarly, when someone is failing, the tendency is to get on a downward spiral that can even become a self-fulfilling prophecy.",
    "When I dare to be powerful, to use my strength in the service of my vision, then it becomes less and less important whether I am afraid.",
    "Whenever you find yourself on the side of the majority, it is time to pause and reflect.",
    "If you don't design your own life plan, chances are you'll fall into someone else's plan. And guess what they have planned for you? Not much.",
    "Find that when you have a real interest in life and a curious life, that sleep is not the most important thing.",
    "The best reason to start an organization is to make meaning; to create a product or service to make the world a better place",
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
          backgroundColor: Colors.red.shade300,
          centerTitle: true,
          title: const Text(
            'Motivational Quotes',
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
                itemCount: motivationQuotesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, motivationQuotesList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            motivationQuotesList[index],
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

  showDialogBox(content, motivationQuotesList) => Get.defaultDialog(
        content: Text(
          motivationQuotesList,
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
                  await Share.share(motivationQuotesList);
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
