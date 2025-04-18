import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String prefixIcon;
  final Widget suffixIcon;
  final String initialText;
  final Function(String)? onChanged;
  final bool isPassword;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.onChanged,
      this.initialText = "",
      this.isPassword = false,
      this.suffixIcon = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      style: Theme.of(context).textTheme.bodySmall,
      cursorColor: ColorManager.whiteColor,
      initialValue: initialText,
      onChanged: onChanged,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Required';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: ColorManager.darkGreyColor,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        prefixIcon: Image.asset(
          prefixIcon,
          width: 2,
          height: 2,
        ),
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
