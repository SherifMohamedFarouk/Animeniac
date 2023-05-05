import 'package:animeniac/features/top_anime/data/models/top_anime_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class TopAnimeRepository {
  Future<Either<Failure, TopAnimeModel>> getTopAnimes();
}
