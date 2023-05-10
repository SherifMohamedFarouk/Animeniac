import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/top_anime_model.dart';

abstract class TopAnimeRepository {
  Future<Either<Failure, TopAnimeModel>> getTopAnimes();
}
