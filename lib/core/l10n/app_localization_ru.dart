import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class MyLocalizationsRu extends MyLocalizations {
  MyLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get hello => 'Salom';

  @override
  String get category => 'Turkumlar';

  @override
  String get login => 'Log In';

  @override
  String get loginerror => 'Successfully logged!';

  @override
  String get logintasdiq => 'Wrong login or password!';

  @override
  String get signup => 'Sign Up';

  @override
  String get signmalumot => 'By continuing, you agree to\nTerms of Use and Privacy Policy.';

  @override
  String get hisob => 'Already have an account?';

  @override
  String get firstName => 'Ism';

  @override
  String get lastName => 'Familya';

  @override
  String get username => 'Ism Familya';

  @override
  String get sana => 'Tug\'ilgan Sana';

  @override
  String get email => 'Elektron Pochta';

  @override
  String get phone => 'Telefon Raqam';

  @override
  String get password => 'Parol';

  @override
  String trendingRecipe(String nimadur) {
    return 'Trenddagi Ritsept $nimadur';
  }
}
