part of 'mangas_bloc.dart';

abstract class MangaState extends Equatable {
  const MangaState();

  @override
  List<Object> get props => [];
}

class MangaInitial extends MangaState {}

class LoadingMangaState extends MangaState {}

class LoadedMangaState extends MangaState {
  final TopMangaModel mangas;

  const LoadedMangaState({required this.mangas});
  @override
  List<Object> get props => [mangas];
}

class ErrorMangasState extends MangaState {
  final String message;

  const ErrorMangasState({required this.message});
  @override
  List<Object> get props => [message];
}
