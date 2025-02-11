import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/caching/cache_helper.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/repository/profile_repo/profile_repo_impl.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/login_screen/login_screen.dart';
import 'package:movies_app/view/screens/reset_password/reset_password_screen.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/pick_avatar_bottom_sheet.dart';
import '../../../cubit/profile_cubit/profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/edit_profile';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.pickAvatar),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(ProfileRepoImpl())..getProfile(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
          BlocListener(listener: (context, state) {
            if (state is UpdateProfileLoading) {
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
            } else if (state is UpdateProfileError) {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      content: Text(
                        state.message,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                      ),
                    );
                  });
            } else if (state is UpdateProfileSuccess) {
              Navigator.pop(context);
              Navigator.pop(context);
            }
          });
        }, builder: (context, state) {
          return BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
            if (state is ProfileLoading) {
              return CircularProgressIndicator();
            } else if (state is ProfileError) {
              return Text('Error');
            }
            var bloc = BlocProvider.of<ProfileCubit>(context);
            var data = bloc.registerResponse!.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 37,
                    ),
                    InkWell(
                        onTap: () {
                          pickAvatarBottomSheet(context, bloc);
                        },
                        child: Image.asset(
                          listOfImages[bloc.newId],
                          fit: BoxFit.cover,
                          width: 150,
                        )),
                    SizedBox(
                      height: 35,
                    ),
                    CustomTextField(
                        onChanged: (val) {
                          bloc.updateNewEmail(val);
                        },
                        hintText: bloc.registerResponse!.data!.email!,
                        prefixIcon: AssetsManager.email),
                    SizedBox(
                      height: 19,
                    ),
                    CustomTextField(
                        onChanged: (val) {},
                        hintText: bloc.registerResponse!.data!.phone!,
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
                          StringsManager.resetPassword,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontFamily: 'Roboto'),
                        ),
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      color: ColorManager.redColor,
                      title: StringsManager.deleteAccount,
                      onPressed: () {
                        bloc.deleteAccount();
                        CacheHelper.clearToken();
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
                        title: StringsManager.updateData,
                        onPressed: () {
                          bloc.updateProfile();
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
            );
          });
        }),
      ),
    );
  }
}
