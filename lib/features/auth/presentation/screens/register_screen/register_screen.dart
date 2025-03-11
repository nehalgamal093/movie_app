import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_switch.dart';
import 'package:movies_app/common_widgets/custom_text_span.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/common_widgets/loading_dialog.dart';
import 'package:movies_app/common_widgets/response_dialog.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:movies_app/features/auth/presentation/screens/register_screen/sections/avatar_slider_section.dart';
import 'package:movies_app/providers/change_state.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:provider/provider.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/resources/string_manager.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.register.tr()),
      ),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              loadingDialog(context);
            } else if (state is RegisterFailedState) {
              Navigator.pop(context);
              responseDialog(context, StringsManager.register, state.failures);
            } else if (state is RegisterSuccessState) {
              Navigator.pop(context);
              Navigator.pushNamed(context, LoginScreen.routeName);
            }
          },
          builder: (context, state) {
            return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
              var bloc = BlocProvider.of<AuthCubit>(context);
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      AvatarSliderSection(
                        onPageChanged: (index, l) {
                          bloc.updateAvatarId(index);
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        StringsManager.avatar.tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                          onChanged: (val) {
                            bloc.updateName(val);
                          },
                          hintText: StringsManager.name.tr(),
                          prefixIcon: AssetsManager.identification),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                          onChanged: (val) {
                            bloc.updateEmail(val);
                          },
                          hintText: StringsManager.email.tr(),
                          prefixIcon: AssetsManager.email),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        onChanged: (val) {
                          bloc.updatePassword(val);
                        },
                        hintText: StringsManager.password.tr(),
                        prefixIcon: AssetsManager.lock,
                        isPassword: provider.obscurePassword,
                        suffixIcon: InkWell(
                          onTap: () {
                            provider.changeObscurePassword();
                          },
                          child: provider.obscurePassword
                              ? Image.asset(AssetsManager.eyeOff)
                              : Icon(
                                  Icons.remove_red_eye,
                                  color: ColorManager.whiteColor,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        onChanged: (val) {
                          bloc.updateConfirmPassword(val);
                        },
                        hintText: StringsManager.confirmPassword.tr(),
                        isPassword: provider.obscureConfirmPassword,
                        prefixIcon: AssetsManager.lock,
                        suffixIcon: InkWell(
                          onTap: () {
                            provider.changeObscureConfirmPassword();
                          },
                          child: provider.obscureConfirmPassword
                              ? Image.asset(AssetsManager.eyeOff)
                              : Icon(
                                  Icons.remove_red_eye,
                                  color: ColorManager.whiteColor,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        onChanged: (val) {
                          bloc.updatePhone(val);
                        },
                        hintText: StringsManager.phoneNumber.tr(),
                        prefixIcon: AssetsManager.phone,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                          color: ColorManager.primaryColor,
                          title: StringsManager.createAccount.tr(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              bloc.register();
                            }
                          },
                          fontFamily: 'Robot',
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      SizedBox(height: 17),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: CustomTextSpan(
                              text1: StringsManager.alreadyHaveAccount.tr(),
                              text2: StringsManager.login.tr())),
                      SizedBox(height: 18),
                      CustomSwitch()
                    ],
                  ),
                ),
              );
            });
          },
        ),
      )),
    );
  }
}
