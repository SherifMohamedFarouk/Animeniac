part of 'anime_search_bloc.dart';

abstract class AnimeSearchState extends Equatable {
  const AnimeSearchState();

  @override
  List<Object> get props => [];
}

class AnimeSearchInitial extends AnimeSearchState {}

class LoadingAnimeSearchState extends AnimeSearchState {}

class LoadedAnimeSearchState extends AnimeSearchState {
  final AnimeSearchModel search;

  const LoadedAnimeSearchState(this.search);
  @override
  List<Object> get props => [search];
}

class ErrorAnimeSearchState extends AnimeSearchState {
  final String message;

  const ErrorAnimeSearchState(this.message);
  @override
  List<Object> get props => [message];
}

class NoResultsAnimeSearchState extends AnimeSearchState {
  const NoResultsAnimeSearchState();
  @override
  List<Object> get props => [];
}
