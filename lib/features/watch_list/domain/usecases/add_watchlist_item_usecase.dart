import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../top_anime/data/models/classes/anime_data.dart';
import '../repository/watchlist_repository.dart';
import 'base_use_case.dart';

class AddWatchlistItemUseCase extends BaseUseCase<int, AnimeData> {
  final WatchlistRepository _baseWatchListRepository;

  AddWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, int>> call(AnimeData p) async {
    return await _baseWatchListRepository.addWatchListItem(p);
  }
}
