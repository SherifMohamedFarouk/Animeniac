import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/manga_search_repository.dart';
import '../data_sources/manga_search_remote_data_source.dart';
import '../models/manga_search_model.dart';
import 'package:dartz/dartz.dart';

class MangaSearchRepositoryImpl implements MangaSearchRepository {
  final MangaSearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MangaSearchRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, MangaSearchModel>> getMangaSearch(
      String search) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMangaList = await remoteDataSource.getMangaSearch(search);
        return Right(remoteMangaList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
