import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier {
  // todo : data
  String appLanguage = "en";

  //todo : function
  void changeAppLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }
}
