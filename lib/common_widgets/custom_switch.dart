import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../core/resources/assets_manager.dart';
import '../theme/color_manager.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: ColorManager.primaryColor,
        trackColor: WidgetStateProperty.all<Color>(ColorManager.blackColor),
        hoverColor: ColorManager.primaryColor,
        trackOutlineColor:
            WidgetStateProperty.all<Color>(ColorManager.primaryColor),
        inactiveThumbImage: AssetImage(AssetsManager.eg),
        activeThumbImage: AssetImage(AssetsManager.rl),
        value: context.locale.toString() == "en",
        onChanged: (val) {
          changeLanguage(context);
        });
  }

  void changeLanguage(BuildContext context) {
    if (context.locale.toString() == "en") {
      context.setLocale(
        const Locale('ar'),
      );
    } else {
      context.setLocale(
        const Locale('en'),
      );
    }
  }
}
