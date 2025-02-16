import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie_credits_cubit/movie_credits_cubit.dart';
import '../widgets/cast_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<MovieCreditsCubit,MovieCreditsState>(builder: (context,state){
          if(state is MovieCreditsLoading){
            return CircularProgressIndicator();
          } else if(state is MovieCreditsError){
            return Text('Error');
          }
          var bloc = BlocProvider.of<MovieCreditsCubit>(context);
          var credits = bloc.movieCreditsResponse!.cast;
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
        })
      ),
    );
  }
}
