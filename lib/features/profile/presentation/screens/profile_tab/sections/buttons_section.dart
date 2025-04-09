import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/caching/cache_helper.dart';
import 'package:movies_app/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import '../../../../../../common_widgets/confirm_dialog.dart';
import '../../../../../../common_widgets/custom_button.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/string_manager.dart';
import '../../../../../../theme/color_manager.dart';
import '../../../bloc/profile_cubit.dart';
import '../../edit_profile_screen/edit_profile_screen.dart';

class ButtonsSection extends StatelessWidget {
  final UserModel user;
  const ButtonsSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomButton(
            color: ColorManager.primaryColor,
            title: StringsManager.editProfile.tr(),
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditProfileScreen.routeName,
                arguments: Arguments(
                    user: user,
                    function: () {
                      context.read<ProfileCubit>().getUser();
                    }),
              );
            },
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: CustomButton(
            color: ColorManager.redColor,
            title: StringsManager.exit.tr(),
            icon: Padding(
              padding: EdgeInsetsDirectional.only(start: 10),
              child: ImageIcon(
                AssetImage(AssetsManager.exit),
                color: ColorManager.whiteColor,
              ),
            ),
            onPressed: () {
              confirmDialog(context, StringsManager.exit,
                  StringsManager.areYouSureLogout.tr(), () {
                CacheHelper.clearToken();
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              });
            },
            leftIcon: false,
            fontSize: 20,
            textColor: ColorManager.whiteColor,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        )
      ],
    );
  }
}

class Arguments {
  UserModel user;
  Function function;
  Arguments({required this.user, required this.function});
}
