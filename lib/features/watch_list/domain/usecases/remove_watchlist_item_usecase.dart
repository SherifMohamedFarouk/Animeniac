import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/watchlist_repository.dart';
import 'base_use_case.dart';

class RemoveWatchlistItemUseCase extends BaseUseCase<Unit, int> {
  final WatchlistRepository _baseWatchListRepository;

  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}
