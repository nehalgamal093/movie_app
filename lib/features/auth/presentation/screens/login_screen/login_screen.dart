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
import 'package:movies_app/features/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:movies_app/providers/change_state.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/forget_password_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../main_page/main_page.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeState>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginLoadingState) {
               loadingDialog(context);
              } else if (state is LoginFailedState) {
                Navigator.pop(context);
               responseDialog(context,StringsManager.login, state.failures);
              } else if (state is LoginSuccessState) {
                Navigator.pop(context);
                Navigator.pushNamed(context, MainPage.routeName);
              }
            },
            builder: (context, state) {
              return BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                var bloc = BlocProvider.of<AuthCubit>(context);
                return Form(
                  key: formKey,
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
                          onChanged: (val) {
                            bloc.updateLoginEmail(val);
                          },
                          hintText: StringsManager.email.tr(),
                          prefixIcon: AssetsManager.email,
                        ),
                        SizedBox(height: 22),
                        CustomTextField(
                          onChanged: (val) {
                            bloc.updateLoginPassword(val);
                          },
                          hintText: StringsManager.password.tr(),
                          prefixIcon: AssetsManager.lock,
                          isPassword: provider.obscurePassword,
                          suffixIcon: InkWell(
                            onTap: () {
                              provider.changeObscurePassword();
                            },
                            child: provider.obscurePassword
                                ? Image.asset(
                                    AssetsManager.eyeOff,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: ColorManager.whiteColor,
                                  ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.routeName);
                            },
                            child: Text(
                              StringsManager.forgetPassword.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorManager.primaryColor,
                                      fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(height: 33),
                        CustomButton(
                          color: ColorManager.primaryColor,
                          title: StringsManager.login.tr(),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              bloc.login();
                            }
                          },
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                        ),
                        SizedBox(height: 22),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                   context, RegisterScreen.routeName);
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
                              ),
                            ),
                            Text(StringsManager.or.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: ColorManager.primaryColor,
                                        fontSize: 15)),
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
                          title: StringsManager.loginGoogle.tr(),
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
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
