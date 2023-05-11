part of 'anime_search_bloc.dart';

abstract class AnimeSearchEvent extends Equatable {
  const AnimeSearchEvent();

  @override
  List<Object> get props => [];
}

class GetAnimeSearchEvent extends AnimeSearchEvent {
  final String search;

  const GetAnimeSearchEvent(this.search);
  @override
  List<Object> get props => [search];
}
