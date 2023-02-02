// ignore_for_file: unnecessary_brace_in_string_interps, deprecated_member_use

import 'dart:async';
// import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unik_qoutes/screen/about_screen.dart';
import 'package:unik_qoutes/screen/absurd.dart';
import 'package:get/get.dart';
import 'package:unik_qoutes/screen/friendship.dart';
import 'package:unik_qoutes/screen/happiness.dart';
import 'package:unik_qoutes/screen/motivation.dart';
import 'package:unik_qoutes/screen/success.dart';
import 'package:unik_qoutes/src/btn/a_btn.dart';
import 'package:unik_qoutes/src/btn/f_btn.dart';
import 'package:unik_qoutes/src/btn/h_btn.dart';
import 'package:unik_qoutes/src/btn/i_btn.dart';
import 'package:unik_qoutes/src/btn/m_btn.dart';
import 'package:unik_qoutes/src/btn/p_btn.dart';
import 'package:unik_qoutes/src/btn/s_btn.dart';
// import 'package:unik_qoutes/src/utils.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'inspiration.dart';
import 'positivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime timeBackPressed = DateTime.now();
  // Connection
  late StreamSubscription subscription;
  var isDeviceConnnected = false;
  bool isAlertSet = false;
  late bool isLoading;

  @override
  void initState() {
    getConnectivity();
    subscription;
    super.initState();
    isLoading = true;

    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  void getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnnected && isAlertSet == false) {
        showDialogBox();
        setState(() => isAlertSet = false);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  // Future<void> _launcherURL(String url) async {
  //   final Uri uri = Uri(scheme: 'https', host: url);
  //   if (!await launchUrl) {
  //     url

  //   }
  // }
  // Future _launchURL(String url) async {
  //   final Uri uri = Uri(scheme: 'https', host: url);
  //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  //     throw "can not launch url";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 3);

          timeBackPressed = DateTime.now();

          if (isExitWarning) {
            const message = 'Press again to exit.';
            Fluttertoast.showToast(
              msg: message,
              fontSize: 16,
              backgroundColor: Colors.brown,
              textColor: Colors.white,
              gravity: ToastGravity.SNACKBAR,
            );
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },

        // rating dialog

        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.brown,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Unik Quotes',
              style: TextStyle(letterSpacing: 2),
            ),
          ),
          drawer: Drawer(
            backgroundColor: Colors.brown,
            child: ListView(
              children: [
                Container(
                  height: 150,
                  color: Colors.brown,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.format_quote_rounded,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Unik Quotes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.home_outlined,
                        ),
                        title: const Text('Home'),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.info_outline,
                        ),
                        title: const Text('About'),
                        onTap: () {
                          Get.to(() => const AboutScreen());
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.share_outlined,
                        ),
                        title: const Text('Share'),
                        onTap: () async {
                          await Share.share(
                              'Hi, check out this Nice App for all kinds quotes for your daily Life \n   https://play.google.com/store/apps/details?id=com.sahotech.unik_quotes');
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.star_outlined,
                        ),
                        title: const Text('Rate Us'),
                        onTap: () async {
                          const url =
                              'https://play.google.com/store/apps/details?id=com.sahotech.unik_quotes';

                          if (await canLaunch(url)) {
                            launch(
                              url,
                              forceSafariVC: false,
                              forceWebView: false,
                              enableJavaScript: false,
                            );
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.lock_outlined,
                        ),
                        title: const Text('Privacy Policy'),
                        onTap: () async {
                          const url =
                              'https://sites.google.com/view/unikquotes/home';

                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceSafariVC: true,
                              forceWebView: true,
                              enableJavaScript: true,
                            );
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.apps_outlined,
                        ),
                        title: const Text('More App'),
                        onTap: () async {
                          const url =
                              'https://play.google.com/store/apps/dev?id=5086544081777088723';

                          if (await canLaunch(url)) {
                            launch(
                              url,
                              forceSafariVC: false,
                              forceWebView: false,
                              enableJavaScript: false,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Get All Your Favorite  QUOTES such as Motivation, Inspiration and other Here For Free.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(() => const AbsurdQuotes()),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: AbsurdBtn(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      setState(() => isAlertSet = false);
                      isDeviceConnnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnnected) {
                        showDialogBox();
                        setState(() => isAlertSet = true);
                      } else {
                        Get.to(() => const FriendshipQuotes());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: FriendshipBtn(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      setState(() => isAlertSet = false);
                      isDeviceConnnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnnected) {
                        showDialogBox();
                        setState(() => isAlertSet = true);
                      } else {
                        Get.to(() => const HappinessQuotes());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: HappinessBtn(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      setState(() => isAlertSet = false);
                      isDeviceConnnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnnected) {
                        showDialogBox();
                        setState(() => isAlertSet = true);
                      } else {
                        Get.to(() => const InspirationaldQuotes());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: InspirationBtn(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      setState(() => isAlertSet = false);
                      isDeviceConnnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnnected) {
                        showDialogBox();
                        setState(() => isAlertSet = true);
                      } else {
                        Get.to(() => const MotivationalQuotes());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: MotivationBtn(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      setState(() => isAlertSet = false);
                      isDeviceConnnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnnected) {
                        showDialogBox();
                        setState(() => isAlertSet = true);
                      } else {
                        Get.to(() => const PositivityQuotes());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: PositivityBtn(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () async {
                      setState(() => isAlertSet = false);
                      isDeviceConnnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnnected) {
                        showDialogBox();
                        setState(() => isAlertSet = true);
                      } else {
                        Get.to(() => const SuccessQuotes());
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: SuccessBtn(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ));
  }

  showDialogBox() => showCupertinoDialog(
        context: context,
        builder: (BuildContext content) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your Internet Connection.'),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(
                  // padding: const EdgeInsets.symmetric(horizontal: 70),

                  // backgroundColor: Colors.brown,
                  ),
              onPressed: () async {
                Navigator.pop(context);
                setState(() => isAlertSet = false);
                isDeviceConnnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnnected) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text(
                'Retry',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown),
              ),
            ),
          ],
        ),
        barrierDismissible: false,
      );
}

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key, required this.menuList, this.icon});

  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
