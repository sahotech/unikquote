import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class SuccessQuotes extends StatefulWidget {
  const SuccessQuotes({super.key});

  @override
  State<SuccessQuotes> createState() => _SuccessQuotesState();
}

class _SuccessQuotesState extends State<SuccessQuotes> {
  List<String> successQuotesList = [
    "Success is the sum of small efforts– repeated day in and day out.",
    "The moment we believe that success is determined by an ingrained level of ability as opposed to resilience and hard work, we will be brittle in the face of adversity.",
    "Success in golf depends less on strength of body than upon strength of mind and character.",
    "The key to success is to focus our conscious mind on things we desire not things we fear.",
    "That some achieve great success, is proof to all that others can achieve it as well.",
    "The worst part of success is, to me, adapting to it. It’s scary.",
    "If you want to increase your success rate, double your failure rate.",
    "Part of being a man is learning to take responsibility for your successes and for your failures. You can’t go blaming others or being jealous. Seeing somebody else’s success as your failure is a cancerous way to live.",
    "The most important thing is being passionate about what you’re doing and always give it your all. That is the key to success.",
    "Good planning is important. I’ve also regarded a sense of humor as one of the most important things on a big expedition. When you’re in a difficult or dangerous situation, or when you’re depressed about the chances of success, someone who can make you laugh eases the tension.",
    "If there is any one secret of success, it lies in the ability to get the other person’s point of view and see things from that person’s angle as well as from your own.",
    "Let us realize that: the privilege to work is a gift, the power to work is a blessing, the love of work is success!",
    "Corporate executives and business owners need to realize that there can be no compromise when it comes to ethics, and there are no easy shortcuts to success. Ethics need to be carefully sown into the fabric of their companies.",
    "We need to accept that we won’t always make the right decisions, that we’ll screw up royally sometimes – understanding that failure is not the opposite of success, it’s part of success.",
    "Ambition is the path to success, persistence is the vehicle you arrive in.",
    "Through perseverance many people win success out of what seemed destined to be certain failure.",
    "I’m an addict, I’m addicted to success. Thankfully, there’s no rehab for success.",
    "In all our deeds, the proper value and respect for time determines success or failure.",
    "If you work just for money, you’ll never make it, but if you love what you’re doing and you always put the customer first, success will be yours.",
    "The level of our success is limited only by our imagination and no act of kindness, however small, is ever wasted.",
    "Honesty and integrity are absolutely essential for success in life – all areas of life. The really good news is that anyone can develop both honesty and integrity.",
    "The path to success is to take massive, determined action.",
    "The only way to permanently change the temperature in the room is to reset the thermostat. In the same way, the only way to change your level of financial success ‘permanently’ is to reset your financial thermostat. But it is your choice whether you choose to change.",
    "Enjoying success requires the ability to adapt. Only by being open to change will you have a true opportunity to get the most from your talent.",
    "Those who cannot work with their hearts achieve but a hollow, half-hearted success that breeds bitterness all around.",
    "The road to success is always under construction.",
    "No foreign policy – no matter how ingenious – has any chance of success if it is born in the minds of a few and carried in the hearts of none.",
    "Each minute is a little thing, and yet, with respect to our personal productivity, to manage the minute is the secret of success.",
    "If you wish to be a success in the world, promise everything, deliver nothing.",
    "The distance between insanity and genius is measured only by success.",
    "The secret of your success is determined by your daily agenda.",
    "Success is steady progress toward one’s personal goals.",
    "Success does not consist in never making mistakes but in never making the same one a second time."
        "The most successful men in the end are those whose success is the result of steady accretion.",
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
          backgroundColor: Colors.pink.shade300,
          centerTitle: true,
          title: const Text(
            'Success Quotes',
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
                itemCount: successQuotesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, successQuotesList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            successQuotesList[index],
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

  showDialogBox(content, successQuotesList) => Get.defaultDialog(
        content: Text(
          successQuotesList,
          style: GoogleFonts.abel(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        title: 'Success',
        titleStyle: const TextStyle(color: Colors.brown),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  await Share.share(successQuotesList);
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
