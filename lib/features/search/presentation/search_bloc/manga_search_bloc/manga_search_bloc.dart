import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../search/manga_search/data/models/manga_search_model.dart';
import '../../../../search/manga_search/domain/use_cases/get_manga_search.dart';

part 'manga_search_event.dart';
part 'manga_search_state.dart';

class MangaSearchBloc extends Bloc<MangaSearchEvent, MangaSearchState> {
  final GetMangaSearchUsecase getMangaSearch;
  MangaSearchBloc({required this.getMangaSearch})
      : super(MangaSearchInitial()) {
    on<MangaSearchEvent>((event, emit) async {
      if (event is GetMangaSearchEvent) {
        emit(LoadingMangaSearchState());
        final failureOrMangaSearch = await getMangaSearch.call(event.search);
        emit(_mapFailureOrMangaSearchToState(failureOrMangaSearch));
      }
    });
  }

  MangaSearchState _mapFailureOrMangaSearchToState(
      Either<Failure, MangaSearchModel> either) {
    return either
        .fold((failure) => ErrorMangaSearchState(_mapFailureTOMessage(failure)),
            (search) {
      return LoadedMangaSearchState(search);
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
