import 'package:flutter/material.dart';
import 'package:movies_app/view/screens/edit_profile_screen/edit_profile_screen.dart';
import '../../../../../common_widgets/custom_button.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/string_manager.dart';
import '../../../../../theme/color_manager.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CustomButton(
            color: ColorManager.primaryColor,
            title: StringsManager.editProfile,
            onPressed: () {
              Navigator.pushNamed(context, EditProfileScreen.routeName);
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
            title: StringsManager.exit,
            icon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ImageIcon(
                AssetImage(AssetsManager.exit),
                color: ColorManager.whiteColor,
              ),
            ),
            onPressed: () {},
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
