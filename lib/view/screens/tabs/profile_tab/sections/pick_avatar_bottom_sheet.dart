import 'package:flutter/material.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/theme/color_manager.dart';

pickAvatarBottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  int selectedIndex = 1;
  return showDialog(
      context: context,
      builder: (context) {
        List<String> listOfImages = [
          AssetsManager.avatarOne,
          AssetsManager.avatarTwo,
          AssetsManager.avatarThree,
          AssetsManager.avatarFour,
          AssetsManager.avatarFive,
          AssetsManager.avatarSix,
          AssetsManager.avatarSeven,
          AssetsManager.avatarEight,
          AssetsManager.avatarNine,
        ];
        return AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: ColorManager.darkGreyColor,
          content: SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: listOfImages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 19,
                        crossAxisSpacing: 19),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color:  selectedIndex==index?ColorManager.primaryWithOpacity:ColorManager.darkGreyColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: ColorManager.primaryColor),
                          ),
                          child: Image.asset(listOfImages[index]),
                        ),
                      );
                    })
              ],
            ),
          ),
        );
      });
}
