import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/caching/cache_helper.dart';
import 'package:movies_app/cubit/profile_cubit/profile_cubit.dart';
import 'package:movies_app/view/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:movies_app/view/screens/login_screen/login_screen.dart';
import '../../../../../common_widgets/confirm_dialog.dart';
import '../../../../../common_widgets/custom_button.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/string_manager.dart';
import '../../../../../theme/color_manager.dart';

class ButtonsSection extends StatelessWidget {
  final ProfileCubit? bloc;
  const ButtonsSection({super.key,required this.bloc});

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
             Navigator.pushNamed(context, EditProfileScreen.routeName,arguments: bloc);
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
              padding:  EdgeInsetsDirectional.only(start: 10),
              child: ImageIcon(
                AssetImage(AssetsManager.exit),
                color: ColorManager.whiteColor,
              ),
            ),
            onPressed: () {
              confirmDialog(context, StringsManager.exit, StringsManager.areYouSureLogout.tr(), (){
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
