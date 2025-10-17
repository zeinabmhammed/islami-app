import 'package:flutter/material.dart';
import 'package:islami/core/cache/cache_keys.dart';
import 'package:islami/core/cache/shared_pref_service.dart';
import 'package:islami/ui/chapter_details/chapter_details.dart';
import 'package:islami/ui/providers/most_recent_provider.dart';
import 'package:islami/ui/common/most_recent_shared_preferences.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/routes.dart';
import 'package:provider/provider.dart';
import 'splash_screens/first_splash_screen.dart';
import 'ui/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences.init();
  await SharedPrefService.init();
  await MostRecentProvider().loadFirstTimeFlag();
  bool isFirstTime =
      SharedPrefService.getBoolean(CacheKeys.isFirstTime) ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),

      child: MyApp(isfirst: isFirstTime),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.isfirst, super.key});

  final bool isfirst;

  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences.getInstance();
    return MaterialApp(
      title: 'Islami App',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      routes: {
        AppRoutes.FirstSplashScreen.route: (context) => FirstSplashScreen(),
        AppRoutes.OnBoardingScreen.route: (context) => OnBoardingScreen(),
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
      },
      initialRoute: isfirst
          ? AppRoutes.FirstSplashScreen.route
          : AppRoutes.HomeScreen.route,
    );
  }
}
