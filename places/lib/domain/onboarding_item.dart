import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/strings.dart';

///OnBoarding data
class OnBoardingItem {
  late final String assetName;
  late final String title;
  late final String description;

  OnBoardingItem(
    String assetName,
    String title,
    String description,
  ) {
    this.assetName = assetName;
    this.title = title;
    this.description = description;
  }

  static List<OnBoardingItem> get items => [
        OnBoardingItem(
          onboarding_1,
          onBoardingTitle_1,
          onBoardingDescription_1,
        ),
        OnBoardingItem(
          onboarding_2,
          onBoardingTitle_2,
          onBoardingDescription_2,
        ),
        OnBoardingItem(
          onboarding_3,
          onBoardingTitle_3,
          onBoardingDescription_3,
        ),
      ];
}
