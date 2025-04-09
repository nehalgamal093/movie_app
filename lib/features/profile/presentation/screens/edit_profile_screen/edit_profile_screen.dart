import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/caching/cache_helper.dart';
import 'package:movies_app/common_widgets/confirm_dialog.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/common_widgets/loading_dialog.dart';
import 'package:movies_app/common_widgets/response_dialog.dart';
import 'package:movies_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/features/profile/data/models/edit_profile_request.dart';
import 'package:movies_app/features/profile/presentation/screens/edit_profile_screen/sections/image_avatar.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/sections/buttons_section.dart';
import 'package:movies_app/theme/color_manager.dart';
import '../../../../../core/resources/string_manager.dart';
import '../../bloc/profile_cubit.dart';
import '../reset_password/reset_password_screen.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/edit_profile';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileRequest editProfileRequest = EditProfileRequest();

  @override
  Widget build(BuildContext context) {
    Arguments arguments =
        ModalRoute.of(context)?.settings.arguments! as Arguments;

    final cubit = context.read<ProfileCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.pickAvatar.tr()),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              arguments.function();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            BlocListener(listener: (context, state) {
              if (state is UserLoading) {
                loadingDialog(context);
              } else if (state is UserError) {
                Navigator.pop(context);
                responseDialog(context, StringsManager.editProfile,
                    state.failures.message.toString());
              } else if (state is UserSuccess) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            });
          },
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 37,
                    ),
                    ImageAvatar(
                      id: arguments.user.data!.avaterId!.toInt(),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CustomTextField(
                        initialText: arguments.user.data!.email!,
                        onChanged: (val) {
                          editProfileRequest.setEmail(val);
                        },
                        hintText: arguments.user.data!.email!,
                        prefixIcon: AssetsManager.email),
                    SizedBox(
                      height: 19,
                    ),
                    CustomTextField(
                        onChanged: (val) {
                          editProfileRequest.setPhone(val);
                        },
                        hintText: arguments.user.data!.phone!,
                        prefixIcon: AssetsManager.phone),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                           Navigator.pushNamed(
                              context, ResetPasswordScreen.routeName);
                        },
                        child: Text(
                          StringsManager.resetPassword.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontFamily: 'Roboto'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    CustomButton(
                      color: ColorManager.redColor,
                      title: StringsManager.deleteAccount.tr(),
                      onPressed: () {
                        confirmDialog(
                            context,
                            StringsManager.deleteAccount.tr(),
                            StringsManager.areYouSureDelete.tr(), () {
                          cubit.deleteAccount();
                          CacheHelper.clearToken();
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginScreen.routeName,(route)=>false);
                        });
                      },
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      textColor: ColorManager.whiteColor,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    CustomButton(
                        color: ColorManager.primaryColor,
                        title: StringsManager.updateData.tr(),
                        onPressed: () {
                          confirmDialog(context, StringsManager.editProfile,
                              StringsManager.areYouSureEdit.tr(), () {
                            if (editProfileRequest.email_ == null) {
                              editProfileRequest
                                  .setEmail(arguments.user.data!.email!);
                            }
                            if (editProfileRequest.phone_ == null) {
                              editProfileRequest
                                  .setPhone(arguments.user.data!.phone!);
                            }
                            if (cubit.currentAvatarId == null) {
                              editProfileRequest
                                  .setAvaterId(arguments.user.data!.avaterId!);
                            } else {
                              editProfileRequest
                                  .setAvaterId(cubit.currentAvatarId!);
                            }
                            BlocProvider.of<ProfileCubit>(context)
                                .updateProfile(editProfileRequest);

                            Navigator.pop(context);
                          });
                        },
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                    SizedBox(
                      height: 33,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
//refactor code
