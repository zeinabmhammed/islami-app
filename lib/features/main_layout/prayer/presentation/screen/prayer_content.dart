import 'package:flutter/material.dart';
import 'package:islami/features/main_layout/prayer/widget/azkar_section.dart';
import 'package:islami/features/main_layout/prayer/widget/pray_time.dart';

class PrayerContent extends StatelessWidget {
  const PrayerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrayTimeWidget(),
          const SizedBox(height: 20),
          AzkarSection(),
        ],
      ),
    );
  }
}
