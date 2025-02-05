import 'package:flutter/material.dart';
import '../resources/assets_manager.dart';
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
        value: true,
        onChanged: (val) {});
  }
}
