import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/anime_search_model.dart';

abstract class AnimeSearchRepository {
  Future<Either<Failure, AnimeSearchModel>> getAnimeSearch(String search);
}
