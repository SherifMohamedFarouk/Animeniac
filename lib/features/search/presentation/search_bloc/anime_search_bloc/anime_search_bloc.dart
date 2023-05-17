import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../anime_search/data/models/anime_search_model.dart';
import '../../../anime_search/domain/use_cases/get_anime_search.dart';

part 'anime_search_event.dart';
part 'anime_search_state.dart';

class AnimeSearchBloc extends Bloc<AnimeSearchEvent, AnimeSearchState> {
  final GetAnimeSearchUsecase getAnimeSearch;
  AnimeSearchBloc({required this.getAnimeSearch})
      : super(AnimeSearchInitial()) {
    on<AnimeSearchEvent>((event, emit) async {
      if (event is GetAnimeSearchEvent) {
        emit(LoadingAnimeSearchState());
        final failureOrAnimeSearch = await getAnimeSearch.call(event.search);
        emit(_mapFailureOrAnimeSearchToState(failureOrAnimeSearch));
      }
    });
  }

  AnimeSearchState _mapFailureOrAnimeSearchToState(
      Either<Failure, AnimeSearchModel> either) {
    return either
        .fold((failure) => ErrorAnimeSearchState(_mapFailureTOMessage(failure)),
            (search) {
      return LoadedAnimeSearchState(search);
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
