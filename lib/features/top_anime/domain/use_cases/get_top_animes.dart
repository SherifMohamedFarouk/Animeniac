import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/top_anime_model.dart';
import '../repositories/top_anime_repository.dart';

class GetTopAnimesUsecase {
  final TopAnimeRepository repository;

  GetTopAnimesUsecase(this.repository);
  Future<Either<Failure, TopAnimeModel>> call(pageIndex) async {
    return await repository.getTopAnimes(pageIndex);
  }
}
