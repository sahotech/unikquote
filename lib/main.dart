import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:unik_qoutes/screen/home_page.dart';

// import 'screen/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: Colors.grey.shade200),
      home: const HomePage(),
    );
  }
}
