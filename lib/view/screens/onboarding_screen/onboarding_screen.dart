import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/models/onboarding_model.dart';
import 'package:movies_app/resources/string_manager.dart';
import '../../../theme/color_manager.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: .8);

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
                          OnboardingModel.get(index).title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        index < OnboardingModel.length - 1
                            ? SizedBox(
                                height: 24,
                              )
                            : SizedBox(),
                        Text(
                          OnboardingModel.get(index).description,
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

                        index < OnboardingModel.length - 1?  CustomButton(
                                color: ColorManager.primaryColor,
                                title: StringsManager.next,
                                onPressed: () {
                                  pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                                }):
                        CustomButton(
                            color: ColorManager.primaryColor,
                            title: StringsManager.finish,
                            onPressed: () {}),
                        SizedBox(
                          height: 16,
                        ),
                        index > 0
                            ? CustomButton(
                                color: ColorManager.blackColor,
                                textColor: ColorManager.primaryColor,
                                title: StringsManager.back,
                                borderColor: ColorManager.primaryColor,
                                onPressed: () {
                                  pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                                })
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
