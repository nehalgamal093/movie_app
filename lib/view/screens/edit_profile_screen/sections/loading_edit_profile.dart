import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';

class LoadingEditProfile extends StatelessWidget {
  const LoadingEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            CircleAvatar(
              radius: 70,
              backgroundColor: ColorManager.darkGreyColor,
            ),
            SizedBox(height: 40,),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: ColorManager.darkGreyColor,

              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: ColorManager.darkGreyColor,

              ),
            )
          ],
        ),
      ),
    );
  }
}
