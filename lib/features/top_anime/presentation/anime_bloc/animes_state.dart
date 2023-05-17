part of 'animes_bloc.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class LoadingAnimeState extends AnimeState {}

class LoadedAnimeState extends AnimeState {
  final TopAnimeModel animes;

  const LoadedAnimeState({required this.animes});
  @override
  List<Object> get props => [animes];
}

class LoadMoreAnimeState extends AnimeState {
  final TopAnimeModel animes;
  const LoadMoreAnimeState({required this.animes});
  @override
  List<Object> get props => [animes];
}

class ErrorAnimesState extends AnimeState {
  final String message;

  const ErrorAnimesState({required this.message});
  @override
  List<Object> get props => [message];
}
