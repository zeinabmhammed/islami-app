import 'package:islami/ui/design.dart';

class OnBoardingData {
  String imagePath;
  String title;
  String? description;

  OnBoardingData({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(
      imagePath: AppImages.introScreen,
      title: "Welcome To Islmi App",
    ),
    OnBoardingData(
      imagePath: AppImages.introScreen2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingData(
      imagePath: AppImages.introScreen3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingData(
      imagePath: AppImages.introScreen4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingData(
      imagePath: AppImages.introScreen5,
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
