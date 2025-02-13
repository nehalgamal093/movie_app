import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../theme/color_manager.dart';

class CustomTextSpan extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomTextSpan({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: text1.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 14)),
          TextSpan(
            text: text2.tr(),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorManager.primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
