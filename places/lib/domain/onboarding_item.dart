import 'package:flutter/material.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/strings.dart';

///OnBoarding data
class OnBoardingItem {
  final String assetName;
  final String title;
  final String description;

  OnBoardingItem({
    @required this.assetName,
    @required this.title,
    @required this.description,
  });

  static List<OnBoardingItem> get items => [
    OnBoardingItem(
      assetName: onboarding_1,
      description: onBoardingDescription_1,
      title: onBoardingTitle_1,
    ),
    OnBoardingItem(
      assetName: onboarding_2,
      description: onBoardingDescription_2,
      title: onBoardingTitle_2,
    ),
    OnBoardingItem(
      assetName: onboarding_3,
      description: onBoardingDescription_3,
      title: onBoardingTitle_3,
    ),
  ];
}