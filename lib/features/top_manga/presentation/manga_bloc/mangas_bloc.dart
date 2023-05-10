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
  MangasBloc({required this.getAllTopMangas}) : super(MangaInitial()) {
    on<MangasEvent>((event, emit) async {
      if (event is GetTopMangasEvent) {
        emit(LoadingMangaState());
        final failureOrMangas = await getAllTopMangas.call();
        emit(_mapFailureOrMangasToState(failureOrMangas));
      } else if (event is RefreshMangasEvent) {
        emit(LoadingMangaState());
        final failureOrMangas = await getAllTopMangas();
        emit(_mapFailureOrMangasToState(failureOrMangas));
      }
    });
  }
  MangaState _mapFailureOrMangasToState(Either<Failure, TopMangaModel> either) {
    return either.fold(
        (failure) => ErrorMangasState(message: _mapFailureTOMessage(failure)),
        (mangas) {
      return LoadedMangaState(mangas: mangas);
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
