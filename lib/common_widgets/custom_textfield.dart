import 'package:flutter/material.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final Widget suffixIcon;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: ColorManager.whiteColor,
      decoration: InputDecoration(
        fillColor: ColorManager.darkGreyColor,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: Image.asset(prefixIcon,width: 2,height: 2,),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
