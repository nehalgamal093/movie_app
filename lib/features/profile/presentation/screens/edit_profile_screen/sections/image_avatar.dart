import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../data/avatar_data.dart';
import '../../../bloc/profile_cubit.dart';
import '../../profile_tab/sections/pick_avatar_bottom_sheet.dart';

class ImageAvatar extends StatelessWidget {
  final int id;
  const ImageAvatar({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return InkWell(
      onTap: () {
        pickAvatarBottomSheet(context,cubit);
      },
      child: Image.asset(
        AvatarData.listOfImages[cubit.currentAvatarId ?? id],
        fit: BoxFit.cover,
        width: 150,
      ),
    );
  }
}
