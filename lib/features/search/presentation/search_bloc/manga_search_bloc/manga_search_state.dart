part of 'manga_search_bloc.dart';

abstract class MangaSearchState extends Equatable {
  const MangaSearchState();

  @override
  List<Object> get props => [];
}

class MangaSearchInitial extends MangaSearchState {}

class LoadingMangaSearchState extends MangaSearchState {}

class LoadedMangaSearchState extends MangaSearchState {
  final MangaSearchModel search;

  const LoadedMangaSearchState(this.search);
  @override
  List<Object> get props => [search];
}

class ErrorMangaSearchState extends MangaSearchState {
  final String message;

  const ErrorMangaSearchState(this.message);
  @override
  List<Object> get props => [message];
}

class NoResultsMangaSearchState extends MangaSearchState {
  const NoResultsMangaSearchState();
  @override
  List<Object> get props => [];
}
