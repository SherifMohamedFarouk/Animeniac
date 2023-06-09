import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/anime_search_repository.dart';
import '../data_sources/anime_search_remote_data_source.dart';
import '../models/anime_search_model.dart';

class AnimeSearchRepositoryImpl implements AnimeSearchRepository {
  final AnimeSearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AnimeSearchRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, AnimeSearchModel>> getAnimeSearch(
      String search) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAnimeList = await remoteDataSource.getAnimeSearch(search);
        return Right(remoteAnimeList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
