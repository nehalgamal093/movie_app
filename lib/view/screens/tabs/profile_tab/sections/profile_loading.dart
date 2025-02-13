import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

class ProfileLoadingSection extends StatelessWidget {
  const ProfileLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.darkGreyColor,
                      radius: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration:
                          BoxDecoration(color: ColorManager.darkGreyColor),
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration:
                          BoxDecoration(color: ColorManager.darkGreyColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration:
                          BoxDecoration(color: ColorManager.darkGreyColor),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      decoration:
                          BoxDecoration(color: ColorManager.darkGreyColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration:
                          BoxDecoration(color: ColorManager.darkGreyColor),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
