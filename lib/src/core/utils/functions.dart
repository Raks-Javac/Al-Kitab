import 'dart:developer';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class KFunctions {
  static void copy(String textCopied, String textLocation, String verse,
      BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Copied Ayah")));
    FlutterClipboard.copy('$textCopied \n $textLocation  $verse ')
        .then((value) => print('copied $textLocation'));
  }

  static void share(
      String shareText, String shareTextExtraction, String verse) {
    Share.share('$shareText', subject: '$shareTextExtraction $verse');
    print("shared");
  }

  static void inAppReviewKitab() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  static void contactUsThroughMail(String email) {
    // ···
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Al-Kitab',
      }),
    );

    launchUrl(emailLaunchUri);
  }
}

logConsole(dynamic message) => log(message.toString());
