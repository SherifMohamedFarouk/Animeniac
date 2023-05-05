part of 'mangas_bloc.dart';

abstract class MangasEvent extends Equatable {
  const MangasEvent();

  @override
  List<Object> get props => [];
}

class GetTopMangasEvent extends MangasEvent {}

class RefreshMangasEvent extends MangasEvent {}

class FetchMoreMangaEvent extends MangasEvent {}
