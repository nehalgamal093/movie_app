import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';
import '../../../../models/movie_credits_response.dart';

class CastItem extends StatelessWidget {
  final Cast cast;
  const CastItem({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: ColorManager.darkGreyColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('http://image.tmdb.org/t/p/w500${cast.profilePath}',width: 70,height: 70,fit: BoxFit.cover,)),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cast.name!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Roboto'),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  cast.character!,
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
