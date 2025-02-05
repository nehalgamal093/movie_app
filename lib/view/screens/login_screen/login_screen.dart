import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_switch.dart';
import 'package:movies_app/common_widgets/custom_text_span.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/forget_password_screen.dart';
import 'package:movies_app/view/screens/register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsManager.logo,
                width: size.width * .25,
              ),
              SizedBox(height: 69),
              CustomTextField(
                hintText: StringsManager.email,
                prefixIcon: AssetsManager.email,
              ),
              SizedBox(height: 22),
              CustomTextField(
                hintText: StringsManager.password,
                prefixIcon: AssetsManager.lock,
                suffixIcon: Image.asset(
                  AssetsManager.eyeOff,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                  },
                  child: Text(
                    StringsManager.forgetPassword,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorManager.primaryColor, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 33),
              CustomButton(
                color: ColorManager.primaryColor,
                title: StringsManager.login,
                onPressed: () {},
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
              SizedBox(height: 22),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                  child: CustomTextSpan(
                      text1: StringsManager.dontHaveAccount,
                      text2: StringsManager.createOne)),
              SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Divider(
                    color: ColorManager.primaryColor,
                    height: 1,
                    indent: 80,
                    endIndent: 10,
                    thickness: 1,
                  )),
                  Text(StringsManager.or,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: ColorManager.primaryColor, fontSize: 15)),
                  Expanded(
                      child: Divider(
                    color: ColorManager.primaryColor,
                    height: 1,
                    indent: 10,
                    thickness: 1,
                    endIndent: 80,
                  )),
                ],
              ),
              SizedBox(height: 28),
              CustomButton(
                color: ColorManager.primaryColor,
                title: StringsManager.loginGoogle,
                textColor: ColorManager.darkGreyColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(AssetsManager.google),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              CustomSwitch()
            ],
          ),
        ),
      ),
    );
  }
}
