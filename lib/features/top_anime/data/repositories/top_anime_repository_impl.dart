import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/top_anime_repository.dart';
import '../data_sources/top_anime_remote_data_source.dart';
import '../models/top_anime_model.dart';

class TopAnimeRepositoryImpl implements TopAnimeRepository {
  final TopAnimeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TopAnimeRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, TopAnimeModel>> getTopAnimes(pageIndex) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAnimeList = await remoteDataSource.getTopAnimes(pageIndex);
        return Right(remoteAnimeList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
