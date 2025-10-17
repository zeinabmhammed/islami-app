import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/ui/common/most_recent_shared_preferences.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/prayer/prayer_content.dart';
import 'package:islami/ui/home/quran/quran_content.dart';
import 'package:islami/ui/home/radio/radio_content.dart';
import 'package:islami/ui/home/sebha/sebha_content.dart';

import '../common/app_screen_wrapper.dart';
import 'hadeth/hadeth_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences provider= MostRecentSharedPreferences.getInstance();
    return AppScreenWrapper(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppImages.islamiLogo, height: 141),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(child: tabs[selectedTapIndex]),
                ),
              ),
            ],
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
                icon: SvgPicture.asset(
                  AppImages.icQuran,
                  width: 27,
                  height: 27,
                ),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.gold,
                icon: SvgPicture.asset(
                  AppImages.icHadeth,
                  width: 27,
                  height: 27,
                ),
                label: "Hadeth",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.gold,
                icon: SvgPicture.asset(
                  AppImages.icsebha,
                  width: 27,
                  height: 27,
                ),
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                backgroundColor: AppColors.gold,
                icon: SvgPicture.asset(
                  AppImages.icRadio,
                  width: 27,
                  height: 27,
                ),
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
      ),
    );
  }

  List<Widget> tabs = [
    QuranContent(),
    HadethContent(),
    SebhaContent(),
    RadioContent(),
    PrayerContent(),
  ];
}
