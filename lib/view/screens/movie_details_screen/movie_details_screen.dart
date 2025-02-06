import 'package:flutter/material.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/header.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie_details';
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Header(),
          )
        ],
      ),
    );
  }
}
