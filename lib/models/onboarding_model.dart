import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel(
      {required this.title, required this.description, required this.image});

  static get length => list.length;

  static OnboardingModel get(int index) {
    return list[index];
  }

  static List<OnboardingModel> list = [
    OnboardingModel(
        title: StringsManager.onBoardingTitle1,
        description: StringsManager.onBoardingDescription1,
        image: AssetsManager.onBoarding2),
    OnboardingModel(
        title: StringsManager.onBoardingTitle2,
        description: StringsManager.onBoardingDescription2,
        image: AssetsManager.onBoarding3),
    OnboardingModel(
        title: StringsManager.onBoardingTitle3,
        description: StringsManager.onBoardingDescription3,
        image: AssetsManager.onBoarding4),
    OnboardingModel(
        title: StringsManager.onBoardingTitle4,
        description: StringsManager.onBoardingDescription4,
        image: AssetsManager.onBoarding5),
    OnboardingModel(
        title: StringsManager.startWatchingNow,
        description: '',
        image: AssetsManager.onBoarding6),
  ];
}
