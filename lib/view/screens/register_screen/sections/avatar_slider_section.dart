import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/avatar_data.dart';

class AvatarSliderSection extends StatelessWidget {
  final Function(int,CarouselPageChangedReason) onPageChanged;
  const AvatarSliderSection({super.key,required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        AvatarData.listOfImages.length,
        (index) => Image.asset(AvatarData.listOfImages[index]),
      ),
      options: CarouselOptions(
        height: 100,
        aspectRatio: 5 / 3,
        viewportFraction: 0.3,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        onPageChanged:onPageChanged,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.4,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
