import 'package:animeniac/features/top_anime/data/models/classes/anime_data.dart';
import 'package:animeniac/features/top_anime/presentation/views/top_anime_imports.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/top_anime_repository.dart';
import 'base_use_case.dart';

class GetAnimeDetailsUseCase extends BaseUseCase<TopAnimeModel, int> {
  final TopAnimeRepository _baseAnimesRespository;

  GetAnimeDetailsUseCase(this._baseAnimesRespository);

  @override
  Future<Either<Failure, TopAnimeModel>> call(int p) async {
    return await _baseAnimesRespository.getAnimeDetails(p);
  }
}
