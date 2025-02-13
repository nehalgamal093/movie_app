import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/common_widgets/loading_dialog.dart';
import 'package:movies_app/common_widgets/response_dialog.dart';
import 'package:movies_app/cubit/profile_cubit/profile_cubit.dart';
import 'package:movies_app/repository/profile_repo/profile_repo_impl.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/change_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/reset_password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.resetPassword.tr()),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(ProfileRepoImpl()),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ResetPasswordLoading) {
              loadingDialog(context);
            } else if (state is ResetPasswordError) {
              Navigator.pop(context);
              responseDialog(
                  context, StringsManager.resetPassword, state.message);
            } else if (state is ResetPasswordSuccess) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      content: Text(
                        StringsManager.success.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, EditProfileScreen.routeName);
                          },
                          child: Text(StringsManager.back.tr()),
                        )
                      ],
                    );
                  });
            }
          },
          builder: (context, state) {
            return BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
              var bloc = BlocProvider.of<ProfileCubit>(context);
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          AssetsManager.logo,
                          width: 150,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        CustomTextField(
                            hintText: StringsManager.oldPassword.tr(),
                            prefixIcon: AssetsManager.lock,
                            onChanged: (val) {
                              bloc.updateOldPassword(val);
                            },
                            isPassword: provider.obscureOldPassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                provider.changeOldPasswordObscure();
                              },
                              child: provider.obscureOldPassword
                                  ? Image.asset(
                                      AssetsManager.eyeOff,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye,
                                      color: ColorManager.whiteColor,
                                    ),
                            )),
                        SizedBox(
                          height: 14,
                        ),
                        CustomTextField(
                          hintText: StringsManager.newPassword.tr(),
                          prefixIcon: AssetsManager.lock,
                          onChanged: (val) {
                            bloc.updateNewPassword(val);
                          },
                          isPassword: provider.obscureNewPassword,
                          suffixIcon: InkWell(
                            onTap: () {
                              provider.changeNewPasswordObscure();
                            },
                            child: provider.obscureNewPassword
                                ? Image.asset(
                                    AssetsManager.eyeOff,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: ColorManager.whiteColor,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            color: ColorManager.primaryColor,
                            title: StringsManager.resetPassword.tr(),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                bloc.resetPassword();
                              }
                            },
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontSize: 20)
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
