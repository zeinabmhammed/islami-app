import 'package:flutter/material.dart';
import 'package:islami/core/cache/cache_keys.dart';
import 'package:islami/core/cache/shared_pref_service.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/on_boarding/model/on_boarding_data.dart';
import 'package:islami/ui/on_boarding/model/widget/dot_indicator.dart';
import 'package:islami/ui/on_boarding/model/widget/page_view_item_widget.dart';
import 'package:islami/ui/routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.islamiLogo, height: 171, width: 279),
            SizedBox(height: 50),
            Expanded(
              child: PageView.builder(
                onPageChanged: (newIndex) {
                  setState(() {
                    currentIndex = newIndex;
                  });
                },
                controller: pageController,
                itemCount: OnBoardingData.onBoardingList.length,
                itemBuilder: (context, index) {
                  var data = OnBoardingData.onBoardingList[index];
                  return PageViewItemWidget(data: data);
                },
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: currentIndex != 0,
                      child: TextButton(
                        onPressed: _backTap,
                        child: Text("Back"),
                      ),
                    ),
                    Spacer(),

                    TextButton(
                      onPressed: _nextTap,
                      child: Text(
                        OnBoardingData.onBoardingList.length - 1 == currentIndex
                            ? "Finish"
                            : "Next",
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(OnBoardingData.onBoardingList.length, (
                      index,
                    ) {
                      return DotIndicator(isActive: currentIndex == index);
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _backTap() {
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _nextTap() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    if (OnBoardingData.onBoardingList.length - 1 == currentIndex) {
      SharedPrefService.saveBoolean(CacheKeys.isFirstTime, false);
      Navigator.pushNamed(context, AppRoutes.HomeScreen.route);
    }
  }
}
