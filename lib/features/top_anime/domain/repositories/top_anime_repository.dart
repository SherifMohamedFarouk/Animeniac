import 'package:animeniac/features/top_anime/data/models/top_anime_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class TopAnimeRepository {
  Future<Either<Failure, TopAnimeModel>> getTopAnimes();
  // Future<Either<Failure, Unit>> deletePost(int id);
  // Future<Either<Failure, Unit>> updatePost(Post post);
  // Future<Either<Failure, Unit>> addPost(Post post);
}
