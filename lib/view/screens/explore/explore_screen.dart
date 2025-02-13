import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/onboarding_screen/onboarding_screen.dart';

class ExploreScreen extends StatelessWidget {
  static const routeName = '/explore';
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.onBoarding1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                StringsManager.findYourFavMovie.tr(),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                StringsManager.getAccessToLibrary.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.whiteColorWithOpacity),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                title: StringsManager.exploreNow.tr(),
                color: ColorManager.primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, OnboardingScreen.routeName);
                },

                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              SizedBox(
                height: 33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
