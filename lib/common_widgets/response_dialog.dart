import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/methods/capitalize.dart';

import '../core/resources/string_manager.dart';
import '../theme/color_manager.dart';

responseDialog(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(title.tr()),
          content: Text(
            message.capitalize(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(StringsManager.close.tr())
            )
          ],
        );
      });
}
