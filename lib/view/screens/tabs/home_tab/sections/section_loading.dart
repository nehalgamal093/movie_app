import 'package:flutter/material.dart';

import '../../../../../theme/color_manager.dart';

class SectionLoading extends StatelessWidget {
  const SectionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ColorManager.darkGreyColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ColorManager.darkGreyColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: ColorManager.darkGreyColor,
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
