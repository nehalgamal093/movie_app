import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/avatar_data.dart';
import 'package:movies_app/theme/color_manager.dart';

import '../../../../../../core/di/di.dart';
import '../../../bloc/profile_cubit.dart';

pickAvatarBottomSheet(BuildContext context,ProfileCubit cubit) {
  Size size = MediaQuery.of(context).size;

  return showDialog(
      context: context,
      builder: (context) {

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
                        itemCount: AvatarData.listOfImages.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 19,
                            crossAxisSpacing: 19),
                        itemBuilder: (context, index) {
                           return InkWell(
                             onTap: () {
                               cubit.updateAvatar(index);
                               Navigator.pop(context);
                             },
                             child: Container(
                               padding: const EdgeInsets.all(5),
                               decoration: BoxDecoration(
                                 color:  cubit.currentAvatarId == index
                                     ? ColorManager.primaryWithOpacity
                                     : ColorManager.darkGreyColor,
                                 borderRadius: BorderRadius.circular(20),
                                 border:
                                 Border.all(color: ColorManager.primaryColor),
                               ),
                               child: Image.asset(AvatarData.listOfImages[index]),
                             ),
                           );

                        })
                  ],
                ),
              ),
            );

      });
}