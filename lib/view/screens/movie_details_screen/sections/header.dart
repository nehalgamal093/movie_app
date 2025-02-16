import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/models/movie_details_response.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/movie_details_screen/sections/bookmark_button.dart';

class Header extends StatelessWidget {
  final MovieDetailsResponse movieDetailsResponse;
  final Function onBack;
  const Header(
      {super.key, required this.movieDetailsResponse, required this.onBack});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
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
          child: movieDetailsResponse.posterPath == null
              ? Image.asset(
                  AssetsManager.noImage,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  'http://image.tmdb.org/t/p/w500${movieDetailsResponse.posterPath!}'),
        ),
        Align(
          child: Container(
            height: size.height * .7,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        onBack();
                      },
                      child: context.locale == "en"
                          ? Image.asset(AssetsManager.arrow)
                          : Transform.flip(
                              flipX: true,
                              child: Image.asset(AssetsManager.backArrow)),
                    ),
                    BookmarkButton(movieDetailsResponse: movieDetailsResponse)
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () async {},
                  child: Image.asset(AssetsManager.play),
                ),
                Spacer(),
                Text(
                  movieDetailsResponse.originalTitle!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  movieDetailsResponse.releaseDate!.substring(0, 4),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: ColorManager.greyColor),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomButton(
                  color: ColorManager.redColor,
                  title: StringsManager.watch.tr(),
                  onPressed: () {},
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  textColor: ColorManager.whiteColor,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
