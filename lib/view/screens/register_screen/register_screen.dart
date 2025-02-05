import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_switch.dart';
import 'package:movies_app/common_widgets/custom_text_span.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.register),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsManager.avatar1),
                  Image.asset(AssetsManager.avatar3),
                  Image.asset(AssetsManager.avatar2),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                StringsManager.avatar,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: 12,
              ),
              CustomTextField(
                  hintText: StringsManager.name,
                  prefixIcon: AssetsManager.identification),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                  hintText: StringsManager.email,
                  prefixIcon: AssetsManager.email),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: StringsManager.password,
                prefixIcon: AssetsManager.lock,
                suffixIcon: Image.asset(AssetsManager.eyeOff),
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: StringsManager.confirmPassword,
                prefixIcon: AssetsManager.lock,
                suffixIcon: Image.asset(AssetsManager.eyeOff),
              ),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                hintText: StringsManager.phoneNumber,
                prefixIcon: AssetsManager.phone,
              ),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                  color: ColorManager.primaryColor,
                  title: StringsManager.createAccount,
                  onPressed: () {},
                  fontFamily: 'Robot',
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
              SizedBox(height:17),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child:CustomTextSpan(text1: StringsManager.alreadyHaveAccount, text2: StringsManager.login)
              ),

              SizedBox(height: 18),
              CustomSwitch()
            ],
          ),
        ),
      ),
    );
  }
}
