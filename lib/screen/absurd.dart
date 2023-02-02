import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import '../ad_helper.dart';
import '../src/widget/card.dart';

class AbsurdQuotes extends StatefulWidget {
  const AbsurdQuotes({super.key});

  @override
  State<AbsurdQuotes> createState() => _AbsurdQuotesState();
}

class _AbsurdQuotesState extends State<AbsurdQuotes> {
  List<String> absurdQuotesList = [
    "Only those who attempt the absurd will achieve the impossible. I think it's in my basement.. let me go up stairs and check.",
    "In order to attain the impossible, one must attempt absurd.",
    "The fact that an opinion has been widely is no evidence whatever that is not utterly absurd",
    "For me, comedy stars as a spew, a kind of explosion, and then you sculpt it from there, if at all. It comes out of a deeper, darker side . Maybe it comes from anger, because I'm outraged by cruel absurdities, the hypocrisy that exist everywhere, even within yourself, where it's hardest to see.",
    "The absurd is the essential concept and first truth.",
    "There is nothing so absurd that some philosopher has not already said it.",
    "It is human nature to think wisely and act in absurd fashion.",
    "Maturity is often more absurd than youth and very frequently is most unjust to youth.",
    "Solitude gives birth to the original in us, to beauty unfamiliar and precious-to poetry. Solitude gives birth to the original in us, to beauty unfamiliar and perilous - to poetry. But also, it gives birth to the opposite: to the perverse, the illicit, the absurd.",
    "Nothing can be more absurd than the practice that prevails in our country of men and women not following the same pursuits with all their strengths and with one mind, for thus, the state instead of being whole is reduced to half.",
    "In politics, as in religion, it is equally absurd to aim at making proselytes by fire and sword. Heresies in either can rarely be cured by persecution.",
    "How absurd men are! They never use the liberties they have, they demand those they do not have. They have freedom of thought, they demand freedom of speech.",
    "What is absurd and monstrous about war is that men who have no personal quarrel should be trained to murder one another in cold blood.",
    "Life may be not only meaningless but absurd.",
    "To be interested in food but not in food production is clearly absurd.",
    "Cut off from his religious, metaphysical and transcendental roots, man is lost; all his actions become senseless, absurd, useless.",
    "I would never, ever trade any campaign donation - that's absurd - for some type of favor to anyone.",
    "I've turned arrogance into an art form, where it's so absurd that it becomes comedy. But I've never done anything to hurt anybody or steal from anyone.",
    "Humanity should question itself, once more, about the absurd and always unfair phenomenon of war, on whose stage of death and pain only remain standing the negotiating table that could and should have prevented it.",
    "Secretly we're all a little more absurd than we make ourselves out to be.",
    "What is the benefit of fasting in our body while filling our souls with innumerable evils? He who does not play at dice, but spends his leisure otherwise, what nonsense does he not utter? What absurdities does he not listen to? Leisure without the fear of God is, for those who do not know how to use time, the teacher of wickedness.",
    "I don't think life is absurd. I think we are all here for a huge purpose. I think we shrink from the immensity of the purpose we are here for.",
    "I think it's absolutely absurd that we're playing on turf, and it's really a slap in the face to women's football by FIFA and just a show of disrespect",
    "While religious tolerance is surely better than religious war, tolerance is not without its liabilities. Our fear of provoking religious hatred has rendered us incapable of criticizing ideas that are now patently absurd and increasingly maladaptive.",
    "It is absurd to look for perfection.",
    "Is it not a species of blasphemy to call the New Testament revealed religion, when we see in it such contradictions and absurdities.",
    "When people conclude that all is futile, then the absurd becomes the norm.",
    "Whatsoever is contrary to nature is contrary to reason, and whatsoever is contrary to reason is absurd.",
    "The most absurd and reckless aspirations have sometimes led to extraordinary success.",
    "Libraries keep the records on behalf of all humanity. the unique and the absurd, the wise and the fragments of stupidity.",
    "Feminism isn't about hating men. It's about challenging the absurd gender distinctions that boys and girls learn from childhood and carry into their adult lives.",
    "Award shows are fun but completely arbitrary and absurd. And yet, I will watch every single one of them.",
    "When you see things upside down, the ego can be extraordinarily funny; it's absurd. But it's tragic at the same time.",
    "When we examine the opinions of men, we find that nothing is more uncommon than common sense; or, in other words, they lack judgment to discover plain truths or to reject absurdities and palpable contradictions.",
    "Love is free; to promise for ever to love the same woman is not less absurd than to promise to believe the same creed; such a vow in both cases excludes us from all inquiry.",
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
  void dispose() {
    super.dispose();
    _banner?.dispose();
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
            'Absurd Quotes',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2,
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
                itemCount: absurdQuotesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // debugPrint(absurdQuotesList[index]);
                      showDialogBox(context, absurdQuotesList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            absurdQuotesList[index],
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

  showDialogBox(content, absurdQuotesList) => Get.defaultDialog(
        radius: 12,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        content: Text(
          absurdQuotesList,
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
                  await Share.share(absurdQuotesList);
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
