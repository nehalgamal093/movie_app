import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/MoviesResponse.dart';

import '../../../../../common_widgets/movie_item.dart';
import '../home_tab.dart';

class SliderSection extends StatelessWidget {
  final List<Results> popularMovies;
  final Function onChanged;
  const SliderSection({super.key,required this.onChanged,required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        popularMovies.length,
        (i) => MovieItem(
            id: popularMovies[i].id.toString(),
            image: 'http://image.tmdb.org/t/p/w500${popularMovies[i].posterPath!}', rating:popularMovies[i].voteAverage.toString()),
      ),
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        onPageChanged: (index, l) {
         onChanged(index);
        },
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
