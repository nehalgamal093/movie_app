import 'package:flutter/material.dart';

import '../../../../models/actor_model.dart';
import '../widgets/cast_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList.separated(
        itemCount: ActorModel.actors.length,
        itemBuilder: (BuildContext context, int index) {
          return CastItem(actorModel:ActorModel.actors[index]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 16),
      ),
    );
  }
}
