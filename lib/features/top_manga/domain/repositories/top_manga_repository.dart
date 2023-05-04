import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/top_manga_model.dart';

abstract class TopMangaRepository {
  Future<Either<Failure, TopMangaModel>> getTopMangas();
}
