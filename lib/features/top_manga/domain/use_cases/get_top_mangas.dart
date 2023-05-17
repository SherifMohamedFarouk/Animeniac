import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/top_manga_model.dart';
import '../repositories/top_manga_repository.dart';

class GetTopMangasUsecase {
  final TopMangaRepository repository;

  GetTopMangasUsecase(this.repository);
  Future<Either<Failure, TopMangaModel>> call(pageIndex) async {
    return await repository.getTopMangas(pageIndex);
  }
}
