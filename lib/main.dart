import 'package:flutter/material.dart';
import 'package:islami/core/cache/cache_keys.dart';
import 'package:islami/core/cache/shared_pref_service.dart';
import 'package:provider/provider.dart';
import 'core/resources/AppTheme.dart';
import 'core/routes_manger/routes.dart';
import 'core/widget/common/most_recent_shared_preferences.dart';
import 'features/chapter_details/chapter_details.dart';
import 'features/main_layout/main_layout.dart';
import 'features/main_layout/quran/providers/most_recent_provider.dart';
import 'features/on_boarding/on_boarding_screen.dart';
import 'splash_screens/first_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences.init();
  //await MostRecentSharedPreferences.getInstance().clear();
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
