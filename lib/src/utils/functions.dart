import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import 'package:share/share.dart';

class Functions {
  void copy(String textCopied, String textLocation, String verse,
      BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Copied Ayah")));
    FlutterClipboard.copy('$textCopied \n $textLocation  $verse ')
        .then((value) => print('copied $textLocation'));
  }

  void share(String shareText, String shareTextExtraction, String verse) {
    Share.share('$shareText', subject: '$shareTextExtraction $verse');
    print("shared");
  }
}
