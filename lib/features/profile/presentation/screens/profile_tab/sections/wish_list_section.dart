import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/features/profile/presentation/bloc/profile_cubit.dart';
import '../../../../../../core/resources/string_manager.dart';
import '../widgets/title_count.dart';

class WishListSection extends StatelessWidget {
  const WishListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getWishlist(),
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is WishlistLoading) {
          return SizedBox();
        } else if (state is WishlistError) {
          return Text(
            state.failures.message.toString(),
          );
        } else if (state is WishlistSuccess) {
          var movies = state.wishlist.dataList;
          return TitleCount(
              title: StringsManager.wishlist.tr(),
              count: movies!.length.toString());
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
