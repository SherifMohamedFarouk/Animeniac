import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/strings/failures.dart';
import '../../data/models/top_manga_model.dart';
import '../../domain/use_cases/get_top_mangas.dart';

part 'mangas_event.dart';
part 'mangas_state.dart';

class MangasBloc extends Bloc<MangasEvent, MangaState> {
  final GetTopMangasUsecase getAllTopMangas;
  int pageIndex = 1;
  MangasBloc({required this.getAllTopMangas}) : super(MangaInitial()) {
    on<MangasEvent>((event, emit) async {
      if (event is GetTopMangasEvent) {
        pageIndex = 1;

        emit(LoadingMangaState());
        final failureOrAnimes = await getAllTopMangas.call(pageIndex);
        emit(_mapFailureOrMangasToState(failureOrAnimes, false));
      } else if (event is RefreshMangasEvent) {
        pageIndex = 1;
        emit(LoadingMangaState());
        final failureOrAnimes = await getAllTopMangas(pageIndex);
        emit(_mapFailureOrMangasToState(failureOrAnimes, false));
      } else if (event is FetchMoreMangaEvent) {
        pageIndex++;

        final failureOrAnimes = await getAllTopMangas.call(pageIndex);
        emit(_mapFailureOrMangasToState(failureOrAnimes, true));
      }
    });
  }

  MangaState _mapFailureOrMangasToState(
      Either<Failure, TopMangaModel> either, bool isMore) {
    return either.fold(
        (failure) => ErrorMangasState(message: _mapFailureTOMessage(failure)),
        (mangas) {
      return LoadedMangaState(mangas: mangas);
      // }
    });
  }

  String _mapFailureTOMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case EmptyCacheFailure:
        return emptyCacheFailureMessage;
      case OfflineFailure:
        return offlineFailureMessage;
      default:
        return "Unexpected Error, Please try again later .";
    }
  }
}
