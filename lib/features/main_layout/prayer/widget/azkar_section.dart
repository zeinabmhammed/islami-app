import 'package:flutter/material.dart';
import 'package:islami/core/resources/AppColors.dart';


class AzkarSection extends StatelessWidget {
  final List<Map<String, String>> azkarList = [
    {"title": "Evening Azkar", "image": "assets/images/azkar1.png"},
    {"title": "Morning Azkar", "image": "assets/images/azkar2.png"},
    {"title": "Sleep Azkar", "image": "assets/images/azkar3.png"},
    {"title": "Wakeup Azkar", "image": "assets/images/azkar4.png"},
    {"title": "Travel Azkar", "image": "assets/images/azkar5.png"},
    {"title": "Mosque Azkar", "image": "assets/images/azkar6.png"},
    {"title": "Food Azkar", "image": "assets/images/azkar7.png"},
    {"title": "General Azkar", "image": "assets/images/azkar8.png"},
    {"title": "Prayer Azkar", "image": "assets/images/azkar9.png"},
    {"title": "Quran Azkar", "image": "assets/images/azkar10.png"},
    {"title": "Daily Azkar", "image": "assets/images/azkar11.png"},
  ];

  @override
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
              return _buildAzkarCard(azkar["title"]!, azkar["image"]!);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAzkarCard(String title, String imagePath) {
    return Container(
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
          Expanded(
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
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
    );
  }
}