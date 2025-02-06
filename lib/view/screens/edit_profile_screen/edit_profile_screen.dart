import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/common_widgets/custom_textfield.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/pick_avatar_bottom_sheet.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = '/edit_profile';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.pickAvatar),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 37,
              ),
              InkWell(
                  onTap: (){
                    pickAvatarBottomSheet(context);
                  },
                  child: Image.asset(AssetsManager.avatar3)),
              SizedBox(
                height: 35,
              ),
              CustomTextField(
                  hintText: 'Nehal Gamal', prefixIcon: AssetsManager.email),
              SizedBox(
                height: 19,
              ),
              CustomTextField(
                  hintText: '3094485858', prefixIcon: AssetsManager.phone),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
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
              CustomButton(color: ColorManager.redColor, title: StringsManager.deleteAccount, onPressed: (){}, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 20,textColor: ColorManager.whiteColor,),
              SizedBox(
                height: 19,
              ),
              CustomButton(color: ColorManager.primaryColor, title: StringsManager.updateData, onPressed: (){}, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 20),
              SizedBox(
                height: 33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
