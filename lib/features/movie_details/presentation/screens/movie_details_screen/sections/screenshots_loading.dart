import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';


class ScreenshotsLoading extends StatelessWidget {
  const ScreenshotsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.darkGreyColor),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.darkGreyColor),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.darkGreyColor),
            ),
          ],
        ),
      ),
    );
  }
}
