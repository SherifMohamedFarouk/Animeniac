import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../top_anime/data/models/classes/anime_data.dart';

abstract class WatchlistRepository {
  Future<Either<Failure, List<AnimeData>>> getWatchListItems();
  Future<Either<Failure, int>> addWatchListItem(AnimeData items);
  Future<Either<Failure, Unit>> removeWatchListItem(int index);
}
