part of 'manga_search_bloc.dart';

abstract class MangaSearchEvent extends Equatable {
  const MangaSearchEvent();

  @override
  List<Object> get props => [];
}

class GetMangaSearchEvent extends MangaSearchEvent {
  final String search;

  const GetMangaSearchEvent(this.search);
  @override
  List<Object> get props => [search];
}
