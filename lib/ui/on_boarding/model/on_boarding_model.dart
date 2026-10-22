import 'package:islami_c20/core/resources/assets_manager.dart';

class OnBoardingModel {
  final String image;

  final String title;
  final String ?subtitle;

  OnBoardingModel({required this.title, required this.image, this.subtitle});
  static List <OnBoardingModel> pages = [
    OnBoardingModel(title: "Welcome To Islmi App", image: AssetsManager.on_boarding_1),
    OnBoardingModel(title: "Welcome To Islami", image: AssetsManager.on_boarding_2,subtitle: "We Are Very Excited To Have You In Our Community"),
    OnBoardingModel(title: "Reading the Quran", image: AssetsManager.on_boarding_3,subtitle: "Read, and your Lord is the Most Generous"),
    OnBoardingModel(title: "Bearish", image: AssetsManager.on_boarding_4,subtitle: "Praise the name of your Lord, the Most High"),
    OnBoardingModel(title: "Holy Quran Radio", image: AssetsManager.on_boarding_5,subtitle: "You can listen to the Holy Quran Radio through the application for free and easily")
  ];
}