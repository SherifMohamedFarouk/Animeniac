part of 'animes_bloc.dart';

abstract class AnimesEvent extends Equatable {
  const AnimesEvent();

  @override
  List<Object> get props => [];
}

class GetTopAnimesEvent extends AnimesEvent {}

class RefreshAnimesEvent extends AnimesEvent {}

class FetchMoreAnimeEvent extends AnimesEvent {}
