import 'package:flutter/material.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../theme/color_manager.dart';

class ActionSection extends StatelessWidget {
  const ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Action',style: Theme.of(context).textTheme.titleMedium!.copyWith(fontFamily: 'Roboto'),),
          Row(
            children: [
              Text('See More',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorManager.primaryColor
              ),
              ),
              SizedBox(width: 5,),
              Image.asset(AssetsManager.arrow)
            ],
          )
        ],
      ),
    );
  }
}
