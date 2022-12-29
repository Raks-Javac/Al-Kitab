import 'package:flutter/material.dart';

class SurahProvider extends ChangeNotifier {
  static bool withTransalation = false;
  bool get getTranslationMode => withTransalation;

  changeTranslationState(bool state) {
    withTransalation = state;
    notifyListeners();
  }
}
