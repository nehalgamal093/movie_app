import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class Header extends StatelessWidget {
  final MovieDetailsResponse movieDetailsResponse;
  const Header({super.key,required this.movieDetailsResponse});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Color(0x88F9FFF9), Color(0x71121312)],
              stops: [0.5, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: Image.network('http://image.tmdb.org/t/p/w500${movieDetailsResponse.posterPath!}'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                movieDetailsResponse.originalTitle!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 15,),
              Text(
                movieDetailsResponse.releaseDate!.substring(0,4),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700, color: ColorManager.greyColor),
              ),
              SizedBox(height: 8,),
              CustomButton(
                color: ColorManager.redColor,
                title: StringsManager.watch,
                onPressed: () {},
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                textColor: ColorManager.whiteColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
