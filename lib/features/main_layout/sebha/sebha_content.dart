import 'package:flutter/material.dart';

import '../../../core/resources/AppColors.dart';
import '../../../core/resources/AppImages.dart';

class SebhaContent extends StatefulWidget {
  const SebhaContent({super.key});

  @override
  State<SebhaContent> createState() => _SebhaContentState();
}

class _SebhaContentState extends State<SebhaContent> {
  double angle = 0;
  int counter = 0;
  List<String> azkarList = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "استغفر الله",
    "لا اله الا الله",
    "لا حول ولا قوة الا بالله",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 36),
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: theme.textTheme.titleLarge?.copyWith(
            color: AppColors.white,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: GestureDetector(
            onTap: _sebhaOnTab,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(AppImages.sebhaHead, width: 145),
                Padding(
                  padding: EdgeInsets.only(top: 72),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: Image.asset(AppImages.sebhaBody, width: 379),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            azkarList[currentIndex],
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$counter",
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _sebhaOnTab() {
    angle += 2;
    counter++;
    if (counter % 33 == 0) {
      currentIndex = (currentIndex + 1) % azkarList.length;
      counter = 0;
    }
    setState(() {});
  }
}
