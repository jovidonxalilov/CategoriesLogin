// import 'package:categorylogin/Categories/data/repository/categories_repository.dart';
// import 'package:categorylogin/category_detail/data/repositories/recipe_repository.dart';
// import 'package:categorylogin/core/client.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Login/data/repository/LogInRepository.dart';
// import 'Login/LogInPage.dart';
// import 'Login/presentation/pages/view/login_view_model.dart';
// import 'core/l10n/app_localization.dart';
//
// void main() {
//   runApp(const LoginView());
// }
//
// class LocalizationViewModel extends ChangeNotifier {
//   Locale _currentLocale = Locale("uz");
//
//   Locale get currentLocale => _currentLocale;
//
//   LocalizationViewModel() {
//     _loadLocale(); // Ilova ishga tushganda oxirgi tanlangan tilni yuklash
//   }
//
//   void setLocale(Locale locale) async {
//     _currentLocale = locale;
//     notifyListeners();
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(
//         "selected_locale", locale.languageCode); // Tanlangan tilni saqlash
//   }
//
//   void _loadLocale() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? langCode = prefs.getString("selected_locale");
//
//     if (langCode != null) {
//       _currentLocale = Locale(langCode);
//       notifyListeners();
//     }
//   }
// }
//
// class LoginView extends StatelessWidget {
//   const LoginView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => LocalizationViewModel(),
//         ),
//         // Provider(
//         //   create: (context) => ApiClient(),
//         // ),
//         // Provider(
//         //   create: (context) => CategoriesRepository(
//         //     client: context.read(),
//         //   ),
//         // ),
//         // Provider(create: RecipeRepository(),),
//       ],
//       builder: (context, child) => MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         localizationsDelegates: [
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//           MyLocalizations.delegate,
//         ],
//         supportedLocales: [Locale("uz"), Locale("en"), Locale("ru")],
//         locale: context.watch<LocalizationViewModel>().currentLocale,
//         debugShowCheckedModeBanner: false,
//         home: CategoryPage(
//           vm: LoginViewModel(
//             repo: AuthRepository(
//               client: ApiClient(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';
// // import 'package:provider/provider.dart';
// // import 'core/dependidce.dart';
// // import 'core/router.dart';
// // import 'core/routes.dart';
// //
// // final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
// //
// // void main() {
// //   runApp(const RecipeApp());
// //   WidgetsBinding.instance.addPostFrameCallback((_) {
// //     globalNavigatorKey.currentContext?.go(
// //       Routes.categoryDetail,
// //       // extra: Icons.cabin_outlined, // ✅ Correct object
// //     );
// //   });
// // }
// //
// // class RecipeApp extends StatelessWidget {
// //   const RecipeApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: providers,
// //       builder: (context, child) => MaterialApp.router(
// //         routerConfig: router,
// //         debugShowCheckedModeBanner: false,
// //         themeMode: ThemeMode.dark,
// //         // darkTheme: AppThemes.darkTheme,
// //       ),
// //     );
// //   }
// // }
// //
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import 'core/dependidce.dart';
import 'core/rout/router.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // App full-screen bo'lib run bo'lishi uchun!
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // darkTheme: AppThemes.darkTheme,
      ),
    );
  }
}
