import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_switch.dart';
import 'package:movies_app/common_widgets/custom_text_span.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/cubit/register_cubit/register_cubit.dart';
import 'package:movies_app/repository/auth_repo/auth_repo_impl.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/login_screen/login_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.register),
      ),
      body: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => RegisterCubit(AuthRepoImpl()),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  });
            } else if (state is RegisterError) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        state.message,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorManager.blackColor),
                      ),
                    );
                  });
            } else if (state is RegisterSuccess) {
              Navigator.pop(context);
              Navigator.pushNamed(context, LoginScreen.routeName);
            }
          },
          builder: (context, state) {
            return BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
              var bloc = BlocProvider.of<RegisterCubit>(context);
              return Form(
                key: formKey,
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
                          onChanged: (val) {
                            bloc.updateName(val);
                          },
                          hintText: StringsManager.name,
                          prefixIcon: AssetsManager.identification),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                          onChanged: (val) {
                            bloc.updateEmail(val);
                          },
                          hintText: StringsManager.email,
                          prefixIcon: AssetsManager.email),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        onChanged: (val) {
                          bloc.updatePassword(val);
                        },
                        hintText: StringsManager.password,
                        prefixIcon: AssetsManager.lock,
                        suffixIcon: Image.asset(AssetsManager.eyeOff),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        onChanged: (val) {
                          bloc.updateConfirmPassword(val);
                        },
                        hintText: StringsManager.confirmPassword,
                        prefixIcon: AssetsManager.lock,
                        suffixIcon: Image.asset(AssetsManager.eyeOff),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomTextField(
                        onChanged: (val) {
                          bloc.updatePhone(val);
                        },
                        hintText: StringsManager.phoneNumber,
                        prefixIcon: AssetsManager.phone,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                          color: ColorManager.primaryColor,
                          title: StringsManager.createAccount,
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
                              text1: StringsManager.alreadyHaveAccount,
                              text2: StringsManager.login)),
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
