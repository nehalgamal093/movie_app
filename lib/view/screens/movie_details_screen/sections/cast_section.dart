import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/movie_credits_cubit/movie_credits_cubit.dart';

import '../../../../models/actor_model.dart';
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
          return Column(
            children: List.generate(4, (index)=>SizedBox(
                height: size.height*.13,
                child: CastItem(cast:credits![index]))),
          );
        })
      ),
    );
  }
}
