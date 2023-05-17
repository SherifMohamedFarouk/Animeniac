import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/manga_search_model.dart';
import '../repositories/manga_search_repository.dart';

class GetMangaSearchUsecase {
  final MangaSearchRepository repository;

  GetMangaSearchUsecase(this.repository);
  Future<Either<Failure, MangaSearchModel>> call(String search) async {
    return await repository.getMangaSearch(search);
  }
}
