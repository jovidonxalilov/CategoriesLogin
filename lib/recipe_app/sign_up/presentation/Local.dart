import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('uz'); // Default til O‘zbekcha

  Locale get locale => _locale;

  void setLocale(String languageCode) {
    _locale = Locale(languageCode);
    notifyListeners(); // Barcha sahifalarni yangilaydi
  }
}
