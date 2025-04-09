import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/common_widgets/loading_dialog.dart';
import 'package:movies_app/common_widgets/response_dialog.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/features/profile/data/models/reset_password_request.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../../../../providers/change_state.dart';
import '../../bloc/profile_cubit.dart';
import '../edit_profile_screen/edit_profile_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/reset_password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.resetPassword.tr()),
      ),
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ResetPasswordLoading) {
              loadingDialog(context);
            } else if (state is ResetPasswordError) {
              Navigator.pop(context);
              responseDialog(context, StringsManager.resetPassword,
                  state.failures.message.toString());
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
                            Navigator.pop(context);
                            Navigator.pop(context);
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
                              resetPasswordRequest.setOldPassword(val);
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
                            resetPasswordRequest.setNewPassword(val);
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
                                if (resetPasswordRequest.newPassword != null &&
                                    resetPasswordRequest.oldPassword != null) {
                                  bloc.resetPassword(resetPasswordRequest);
                                }
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
