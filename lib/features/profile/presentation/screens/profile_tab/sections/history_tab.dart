import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common_widgets/loading_movies.dart';
import 'package:movies_app/common_widgets/movie_item.dart';
import 'package:movies_app/features/profile/presentation/bloc/profile_cubit.dart';

import '../../../../../../core/di/di.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<ProfileCubit>()..getWishlist(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
        if (state is WishlistLoading) {
          return LoadingMovies();
        } else if (state is WishlistError) {
          return Text(state.failures.message.toString());
        } else if(state is WishlistSuccess){
          var movies = state.wishlist.dataList;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
                itemCount: movies!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 122 / 179),
                itemBuilder: (context, index) {
                  return MovieItem(
                    onBack: (){
                      // bloc.getFavoriteMovies();
                    },
                    id: movies[index].movieId!,
                    image: movies[index].imageURL!,
                    rating: movies[index].rating.toString(),
                  );
                }),
          );
        } else {
          return SizedBox();
        }


      }),
    );
  }
}
