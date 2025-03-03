import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class MyLocalizationsEn extends MyLocalizations {
  MyLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

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
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get username => 'Full Name';

  @override
  String get sana => 'Date Of Birth';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Mobile Number';

  @override
  String get password => 'Password';

  @override
  String trendingRecipe(String nimadur) {
    return 'Trending Recipe $nimadur';
  }
}
