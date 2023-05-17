import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/strings/failures.dart';
import '../../data/models/top_anime_model.dart';
import '../../domain/use_cases/get_top_animes.dart';

part 'animes_event.dart';
part 'animes_state.dart';

class AnimesBloc extends Bloc<AnimesEvent, AnimeState> {
  final GetTopAnimesUsecase getAllTopAnimes;
  int pageIndex = 1;
  AnimesBloc({required this.getAllTopAnimes}) : super(AnimeInitial()) {
    on<AnimesEvent>((event, emit) async {
      if (event is GetTopAnimesEvent) {
        pageIndex = 1;

        emit(LoadingAnimeState());
        final failureOrAnimes = await getAllTopAnimes.call(pageIndex);
        emit(_mapFailureOrAnimesToState(failureOrAnimes, false));
      } else if (event is RefreshAnimesEvent) {
        pageIndex = 1;
        emit(LoadingAnimeState());
        final failureOrAnimes = await getAllTopAnimes(pageIndex);
        emit(_mapFailureOrAnimesToState(failureOrAnimes, false));
      } else if (event is FetchMoreAnimeEvent) {
        pageIndex++;

        final failureOrAnimes = await getAllTopAnimes.call(pageIndex);
        emit(_mapFailureOrAnimesToState(failureOrAnimes, true));
      }
    });
  }
  AnimeState _mapFailureOrAnimesToState(
      Either<Failure, TopAnimeModel> either, bool isMore) {
    return either.fold(
        (failure) => ErrorAnimesState(message: _mapFailureTOMessage(failure)),
        (animes) {
      return LoadedAnimeState(animes: animes);
      // }
    });
  }

  String _mapFailureTOMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later .";
    }
  }
}
