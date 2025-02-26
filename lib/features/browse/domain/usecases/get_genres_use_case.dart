import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/browse/domain/repository/browse_repo.dart';
import '../../../../core/failures/failures.dart';

@injectable
 class GetGenresUseCase{
   BrowseRepo repo;
  GetGenresUseCase(this.repo);

   Future<Either<AppFailures, GenresModel>> call() => repo.getGenres();
}