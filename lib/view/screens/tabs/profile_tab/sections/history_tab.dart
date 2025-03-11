// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/common_widgets/loading_movies.dart';
// import 'package:movies_app/common_widgets/movie_item.dart';
// import 'package:movies_app/cubit/movie_details_cubit/movie_details_cubit.dart';
// import 'package:movies_app/cubit/movie_details_cubit/movie_details_state.dart';
// import 'package:movies_app/repository/movie_details_repo/movie_details_impl.dart';
//
// class HistoryTab extends StatelessWidget {
//   const HistoryTab({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           MovieDetailsCubit(MovieDetailsImpl())..getFavoriteMovies(),
//       child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
//           builder: (context, state) {
//         if (state is FavoriteMoviesLoading) {
//           return LoadingMovies();
//         } else if (state is FavoriteMoviesError) {
//           return Text(state.message.toString());
//         }
//         var bloc = BlocProvider.of<MovieDetailsCubit>(context);
//         var movies = bloc.favoriteMovies!.data!;
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: GridView.builder(
//               itemCount: movies.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisSpacing: 16,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 122 / 179),
//               itemBuilder: (context, index) {
//                 return MovieItem(
//                   onBack: (){
//                     bloc.getFavoriteMovies();
//                   },
//                   id: movies[index].movieId!,
//                   image: movies[index].imageURL!,
//                   rating: movies[index].rating.toString(),
//                 );
//               }),
//         );
//       }),
//     );
//   }
// }
