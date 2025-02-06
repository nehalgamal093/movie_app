import 'package:flutter/material.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class MovieItem extends StatelessWidget {
  final String image;
  final String rating;
  const MovieItem({super.key,required this.image,required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset(image),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric( vertical: 10,horizontal: 10),
          decoration: BoxDecoration(
              color: ColorManager.blackColorWithOpacity,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                rating,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Image.asset(AssetsManager.star),
            ],
          ),
        )
      ],
    );
  }

}
