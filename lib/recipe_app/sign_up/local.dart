import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../../core/l10n/app_localization.dart';

// void main() {
//   runApp(const MyApp());
// }
class LocalizationViewModel extends ChangeNotifier {
  Locale _currentLocale = Locale("en");

  Locale get currentLocale => _currentLocale;

  set currentLocale(Locale locale) {
    _currentLocale = locale;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationViewModel()),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MyLocalizations.delegate,
        ],
        supportedLocales: [Locale("uz"), Locale("en"), Locale("ru")],
        locale: context.watch<LocalizationViewModel>().currentLocale,
      ),
    );
  }
}
