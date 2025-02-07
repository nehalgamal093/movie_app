import 'package:flutter/material.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';
import '../../../../resources/assets_manager.dart';
import '../widgets/icon_text.dart';

class IconsCountSection extends StatelessWidget {
  final MovieDetailsResponse movieDetails;
  const IconsCountSection({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconText(
            image: AssetsManager.heart,
            count: movieDetails.voteCount.toString(),
          ),
          SizedBox(
            width: 16,
          ),
          IconText(
            image: AssetsManager.watch,
            count: movieDetails.runtime.toString(),
          ),
          SizedBox(
            width: 16,
          ),
          IconText(
            image: AssetsManager.star2,
            count: movieDetails.voteAverage.toString().substring(0, 3),
          ),
        ],
      ),
    );
  }
}
