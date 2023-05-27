import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/anime_search_model.dart';
import '../repositories/anime_search_repository.dart';

class GetAnimeSearchUsecase {
  final AnimeSearchRepository repository;

  GetAnimeSearchUsecase(this.repository);
  Future<Either<Failure, AnimeSearchModel>> call(String search) async {
    return await repository.getAnimeSearch(search);
  }
}
