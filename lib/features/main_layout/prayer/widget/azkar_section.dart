import 'package:flutter/material.dart';
import 'package:islami/core/resources/AppColors.dart';
import 'package:islami/features/main_layout/prayer/widget/azkar_details_screen.dart';

class AzkarSection extends StatelessWidget {
  final List<Map<String, String>> azkarList = [
    {
      "title": "Evening Azkar",
      "image": "assets/images/azkar1.png",
      "jsonKey": "أذكار المساء",
    },
    {
      "title": "Morning Azkar",
      "image": "assets/images/azkar2.png",
      "jsonKey": "أذكار الصباح",
    },
    {
      "title": "Sleep Azkar",
      "image": "assets/images/azkar3.png",
      "jsonKey": "أذكار النوم",
    },
    {
      "title": "Wakeup Azkar",
      "image": "assets/images/azkar4.png",
      "jsonKey": "أذكار الاستيقاظ",
    },

    {
      "title": "Tsabeeh",
      "image": "assets/images/azkar7.png",
      "jsonKey": "تسابيح",
    },
    {
      "title": "General Azkar",
      "image": "assets/images/azkar8.png",
      "jsonKey": "أذكار عامة",
    },
    {
      "title": "Prayer Azkar",
      "image": "assets/images/azkar9.png",
      "jsonKey": "أذكار بعد السلام من الصلاة المفروضة",
    },
    {
      "title": "Quran Azkar",
      "image": "assets/images/azkar10.png",
      "jsonKey": "أدعية قرآنية",
    },
    {
      "title": "Prophets Azkar",
      "image": "assets/images/azkar11.png",
      "jsonKey": "أدعية الأنبياء",
    },
  ];

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Azkar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: 270,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: azkarList.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final azkar = azkarList[index];
              return _buildAzkarCard(
                context,
                azkar["title"]!,
                azkar["image"]!,
                azkar["jsonKey"]!,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAzkarCard(
    BuildContext context,
    String title,
    String imagePath,
    String azkarType,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                AzkarDetailScreen(azkarType: azkarType, title: title),
          ),
        );
      },
      child: Container(
        height: 259,
        width: 185,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF202020),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.gold, width: 2),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Expanded(child: Image.asset(imagePath, fit: BoxFit.cover)),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
