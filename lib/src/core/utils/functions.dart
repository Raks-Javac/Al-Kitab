import 'dart:developer';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/res/res.dart';
import '../navigation/navigation_1.0.dart';
import 'constants.dart';
import 'enums.dart';

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

  void showSnack(String message) {
    InAppNotification.show(
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: KAppConstants.appThemeEnum == AppThemeEnum.blackMode
              ? KColors.black
              : KColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            message,
            style: Theme.of(KNavigator.navigatorKey!.currentContext!)
                .textTheme
                .bodyMedium!
                .copyWith(color: KColors.whiteColor),
          ),
        ),
      ),
      context: KNavigator.navigatorKey!.currentContext!,
      duration: Duration(seconds: 1),
      onTap: () => print('Notification tapped!'),
    );
  }
}

logConsole(dynamic message) => log(message.toString());
