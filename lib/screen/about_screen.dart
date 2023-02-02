// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Text(
                'About App',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const AutoSizeText(
                        'App Developed By:',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Saho Tech',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const AutoSizeText(
                    'This App is made to provide Daily Life Quotes such as Motivation, Inspiration, Happiness, Positivity, and Others.',
                    style: TextStyle(
                        fontSize: 18, color: Colors.black54, letterSpacing: 1),
                    maxLines: 3,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const AutoSizeText(
                    "I hope You will love this App. Please if this App provide all your daily life quoes for you then don't forget to Rate this App on PlayStore and Share to your friends and other.",
                    style: TextStyle(
                        fontSize: 18, color: Colors.black54, letterSpacing: 1),
                    maxLines: 5,
                    maxFontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'How to',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'To share Quotes on the App, just navigate to your favorite quotes list and clichk or tap on it and it will open in dialog with share button for you to click on to share or copy and paste the quote to Social Media Directly. ',
                  style: TextStyle(
                      fontSize: 18, color: Colors.black54, letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.share_outlined,
                        size: 32,
                      ),
                      onPressed: () async {
                        await Share.share(
                            'Hi, check out this Nice App for all kinds quotes for your daily Life \n   https://play.google.com/store/apps/details?id=com.sahotech.newsportal');
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(
                        Icons.star_border_outlined,
                        size: 32,
                      ),
                      onPressed: () async {
                        const url =
                            'https://play.google.com/store/apps/details?id=com.sahotech.newsportal';

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
              )
            ],
          ),
        ),
      ),

      // ),
    );
  }
}
