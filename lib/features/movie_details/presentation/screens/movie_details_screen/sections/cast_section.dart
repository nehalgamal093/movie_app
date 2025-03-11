import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_cubit.dart';
import '../widgets/cast_item.dart';

class CastSection extends StatelessWidget {
  final String id;
  const CastSection({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: BlocProvider(
          create: (context)=>getIt<MovieDetailsCubit>()..getCredits(id),
          child: BlocBuilder<MovieDetailsCubit,MovieDetailsState>(builder: (context,state){
            if(state is CreditsLoadingState){
              return CircularProgressIndicator();
            } else if(state is CreditsErrorState){
              return Text('Error');
            }
            var bloc = BlocProvider.of<MovieDetailsCubit>(context);
            var credits = bloc.creditModel!.cast;
            int listLength = 0;
            if(credits!.isNotEmpty&& credits.length>4){
              listLength = 4;
            } else{
              listLength = credits.length;
            }
            return Column(
              children: List.generate(listLength, (index)=>SizedBox(
                  height: size.height*.13,
                  child: CastItem(cast:credits[index]))),
            );
          }),
        )
      ),
    );
  }
}
