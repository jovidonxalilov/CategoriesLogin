import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class MyLocalizationsUz extends MyLocalizations {
  MyLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get hello => 'Salom';

  @override
  String get category => 'Turkumlar';

  @override
  String get login => 'Kirish';

  @override
  String get loginerror => 'Muvaffaqiyatli login qilindi!';

  @override
  String get logintasdiq => 'Login yoki parol noto‘g‘ri!';

  @override
  String get signup => 'Ro\'yxatdan O\'tish';

  @override
  String get signmalumot => 'Davom etib, siz rozi bo\'lasiz\nFoydalanish shartlari va maxfiylik siyosati.';

  @override
  String get hisob => 'Siz allaqachon hisobingiz bormi?';

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
