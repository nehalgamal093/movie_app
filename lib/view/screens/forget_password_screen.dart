import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

import '../../core/resources/string_manager.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forget_password';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.forgetPassword.tr()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(AssetsManager.forgetPassword.tr()),
              SizedBox(
                height: 24,
              ),
              CustomTextField(
                  onChanged: (val) {},
                  hintText: StringsManager.email.tr(),
                  prefixIcon: AssetsManager.email),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                color: ColorManager.primaryColor,
                title: StringsManager.verifyEmail.tr(),
                onPressed: () {},
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              )
            ],
          ),
        ),
      ),
    );
  }
}
