import 'package:flutter/material.dart';
import '../theme/color_manager.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Widget icon;
  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final bool leftIcon;
  final Function() onPressed;
  const CustomButton({
    super.key,
    required this.color,
    required this.title,
    required this.onPressed,
    required this.fontFamily,
    required this.fontWeight,
    required this.fontSize,
    this.textColor = ColorManager.blackColor,
    this.borderColor = Colors.transparent,
    this.leftIcon = true,
    this.icon = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leftIcon?icon:SizedBox(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: textColor,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      fontFamily: fontFamily),
                ),
                leftIcon?SizedBox():icon
              ],
            ),
          ),
        ),
      ],
    );
  }
}
