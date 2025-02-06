import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/custom_button.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            // Create a linear gradient shader for the mask
            return LinearGradient(
              colors: [Color(0x88F9FFF9), Color(0x71121312)],
              stops: [0.5, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: Image.asset(AssetsManager.moviePoster5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'Doctor Strange in the Multiverse of Madness',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 15,),
              Text(
                '2022',
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
