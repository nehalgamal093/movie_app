// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/cubit/movie_details_cubit/movie_details_cubit.dart';
// import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
// import 'package:movies_app/repository/movie_details_repo/movie_details_impl.dart';
// import '../../../../../resources/string_manager.dart';
// import '../widgets/title_count.dart';
//
// class WishListSection extends StatelessWidget {
//   const WishListSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           MovieDetailsCubit(MovieDetailsImpl())..getFavoriteMovies(),
//       child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
//           builder: (context, state) {
//         if (state is FavoriteMoviesLoading) {
//           return SizedBox();
//         } else if (state is FavoriteMoviesError) {
//           return Text(
//             state.message.toString(),
//           );
//         }
//         var bloc = BlocProvider.of<MovieDetailsCubit>(context);
//         var movies = bloc.favoriteMovies!.data!;
//         return TitleCount(
//             title: StringsManager.wishlist.tr(),
//             count: movies.length.toString());
//       }),
//     );
//   }
// }
