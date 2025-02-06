import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/movie_item.dart';
import '../home_tab.dart';

class SliderSection extends StatelessWidget {
  final Function onChanged;
  const SliderSection({super.key,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        list.length,
        (i) => MovieItem(image: list[i], rating: '7.7'),
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
