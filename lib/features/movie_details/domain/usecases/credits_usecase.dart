import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/data/models/credit_model.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_repo.dart';
import '../../../../core/failures/failures.dart';

@injectable
class CreditsUseCase {
  MovieDetailsRepo movieDetailsRepo;
  CreditsUseCase(this.movieDetailsRepo);

  Future<Either<AppFailures, CreditModel>> call(String id) =>
      movieDetailsRepo.getCredits(id);
}
