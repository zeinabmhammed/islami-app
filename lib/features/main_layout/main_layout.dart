import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/features/main_layout/prayer/presentation/screen/prayer_content.dart';
import 'package:islami/features/main_layout/quran/quran_content.dart';
import 'package:islami/features/main_layout/radio/presentation/screen/radio_screen.dart';
import 'package:islami/features/main_layout/sebha/sebha_content.dart';
import '../../core/resources/AppColors.dart';
import '../../core/resources/AppImages.dart';
import '../../core/widget/common/app_screen_wrapper.dart';
import '../../core/widget/common/most_recent_shared_preferences.dart';
import 'hadeth/hadeth_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;

  final List<String> tabBackgrounds = [
    AppImages.defaultBackground,
    AppImages.hadeth,
    AppImages.sebhaBackground,
    AppImages.radioBackground,
    AppImages.timeScreenBackground,
  ];

  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences provider =
        MostRecentSharedPreferences.getInstance();
    return AppScreenWrapper(
      backgroundImagePath: tabBackgrounds[selectedTapIndex],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.islamiLogo, height: 130),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(child: tabs[selectedTapIndex]),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTapIndex,
          onTap: (index) {
            setState(() {
              selectedTapIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppImages.icQuran, width: 27, height: 27),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppImages.icHadeth, width: 27, height: 27),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppImages.icsebha, width: 27, height: 27),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppImages.icRadio, width: 27, height: 27),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppImages.icTime, width: 27, height: 27),
              label: "Prayer",
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> tabs = [
    QuranContent(),
    HadethContent(),
    SebhaContent(),
    RadioScreen(),
    PrayerContent(),
  ];
}
