import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/methods/capitalize.dart';
import 'package:movies_app/resources/string_manager.dart';

import '../theme/color_manager.dart';

confirmDialog(BuildContext context,String title,String message,Function() action){
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(title.tr()),
          content: Text(
            message.capitalize().tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: action,
              child: Text(title.tr()),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(StringsManager.back.tr()),
            )
          ],
        );
      });
}