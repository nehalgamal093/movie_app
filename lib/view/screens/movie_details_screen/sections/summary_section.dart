import 'package:flutter/material.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';

class SummarySection extends StatelessWidget {
  final MovieDetailsResponse movieDetails;
  const SummarySection({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          movieDetails.overview!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
