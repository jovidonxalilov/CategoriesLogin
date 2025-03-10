
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import 'core/dependidce.dart';
import 'core/rout/router.dart';

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) => ScreenUtilInit(
        designSize: Size(430, 932),
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          // darkTheme: AppThemes.darkTheme,
        ),
      ),
    );
  }
}
