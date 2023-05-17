import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/manga_search_model.dart';

abstract class MangaSearchRepository {
  Future<Either<Failure, MangaSearchModel>> getMangaSearch(String search);
}
