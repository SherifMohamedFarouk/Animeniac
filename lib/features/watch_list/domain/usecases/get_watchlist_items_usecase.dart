import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../top_anime/data/models/classes/anime_data.dart';
import '../repository/watchlist_repository.dart';
import 'base_use_case.dart';

class GetWatchlistItemsUseCase
    extends BaseUseCase<List<AnimeData>, NoParameters> {
  final WatchlistRepository _baseWatchListRepository;

  GetWatchlistItemsUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, List<AnimeData>>> call(NoParameters p) async {
    return await _baseWatchListRepository.getWatchListItems();
  }
}
