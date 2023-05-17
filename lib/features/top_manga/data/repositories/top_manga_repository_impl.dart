import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/top_manga_repository.dart';
import '../data_sources/top_manga_remote_data_source.dart';
import '../models/top_manga_model.dart';

class TopMangaRepositoryImpl implements TopMangaRepository {
  final TopMangaRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TopMangaRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, TopMangaModel>> getTopMangas(pageIndex) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteMangaList = await remoteDataSource.getTopMangas(pageIndex);
        return Right(remoteMangaList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
