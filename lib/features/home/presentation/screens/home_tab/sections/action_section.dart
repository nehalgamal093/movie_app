import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Action',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontFamily: 'Roboto'),
          ),
          Row(
            children: [
              Text(
                StringsManager.seeMore.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorManager.primaryColor),
              ),
              SizedBox(
                width: 5,
              ),
              context.locale =="en"?Image.asset(AssetsManager.arrow):Transform.flip(
                flipX: true,
                child: Image.asset(AssetsManager.arrow)
              )
            ],
          )
        ],
      ),
    );
  }
}
