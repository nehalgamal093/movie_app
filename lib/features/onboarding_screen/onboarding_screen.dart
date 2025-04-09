import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:movies_app/models/onboarding_model.dart';
import '../../../core/resources/string_manager.dart';
import '../../../theme/color_manager.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController =
  PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: OnboardingModel.length,
        itemBuilder: (context, index) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      OnboardingModel.get(index).image,
                    ),
                    fit: BoxFit.fitWidth),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.blackColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          OnboardingModel.get(index).title.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        index < OnboardingModel.length - 1
                            ? SizedBox(
                          height: 24,
                        )
                            : SizedBox(),
                        Text(
                          OnboardingModel.get(index).description.tr(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        index < OnboardingModel.length - 1
                            ? SizedBox(
                          height: 24,
                        )
                            : SizedBox(),
                        index < OnboardingModel.length - 1
                            ? CustomButton(
                          color: ColorManager.primaryColor,
                          title: StringsManager.next.tr(),
                          onPressed: () {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        )
                            : CustomButton(
                          color: ColorManager.primaryColor,
                          title: StringsManager.finish.tr(),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, LoginScreen.routeName);
                          },
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        index > 0
                            ? CustomButton(
                          color: ColorManager.blackColor,
                          textColor: ColorManager.primaryColor,
                          title: StringsManager.back.tr(),
                          borderColor: ColorManager.primaryColor,
                          onPressed: () {
                            pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}