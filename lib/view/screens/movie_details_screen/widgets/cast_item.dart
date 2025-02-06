import 'package:flutter/material.dart';
import 'package:movies_app/models/actor_model.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class CastItem extends StatelessWidget {
  final ActorModel actorModel;
  const CastItem({super.key, required this.actorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: ColorManager.darkGreyColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(actorModel.image)),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actorModel.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Roboto'),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  actorModel.character,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Roboto'),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
