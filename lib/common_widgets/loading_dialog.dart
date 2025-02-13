import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

loadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Center(
            child: CircularProgressIndicator(
              color: ColorManager.primaryColor,
            ),
          ),
        );
      });
}
