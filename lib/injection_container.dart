import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/auth/data/data_sources/firebase_data_source.dart';
import 'features/auth/data/data_sources/firebase_data_source_impl.dart';
import 'features/auth/data/repositories/firebase_repository_impl.dart';
import 'features/auth/domain/repositories/firebase_repository.dart';
import 'features/auth/domain/use_cases/sign_in_usecase.dart';
import 'features/auth/domain/use_cases/sign_out_usecase.dart';
import 'features/auth/domain/use_cases/sign_up_usecase.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/search/anime_search/data/data_sources/anime_search_remote_data_source.dart';
import 'features/search/anime_search/data/repositories/anime_search_repository_impl.dart';
import 'features/search/anime_search/domain/repositories/anime_search_repository.dart';
import 'features/search/anime_search/domain/use_cases/get_anime_search.dart';
import 'features/search/manga_search/data/data_sources/manga_search_remote_data_source.dart';
import 'features/search/manga_search/data/repositories/manga_search_repository_impl.dart';
import 'features/search/manga_search/domain/repositories/manga_search_repository.dart';
import 'features/search/manga_search/domain/use_cases/get_manga_search.dart';
import 'features/search/presentation/search_bloc/anime_search_bloc/anime_search_bloc.dart';
import 'features/search/presentation/search_bloc/manga_search_bloc/manga_search_bloc.dart';
import 'features/top_anime/data/data_sources/top_anime_remote_data_source.dart';
import 'features/top_anime/data/repositories/top_anime_repository_impl.dart';
import 'features/top_anime/domain/repositories/top_anime_repository.dart';
import 'features/top_anime/domain/use_cases/get_top_animes.dart';
import 'features/top_anime/presentation/anime_bloc/animes_bloc.dart';
import 'features/top_manga/data/data_sources/top_manga_remote_data_source.dart';
import 'features/top_manga/data/repositories/top_manga_repository_impl.dart';
import 'features/top_manga/domain/repositories/top_manga_repository.dart';
import 'features/top_manga/domain/use_cases/get_top_mangas.dart';
import 'features/top_manga/presentation/manga_bloc/mangas_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features: posts

  //Bloc
  sl.registerFactory(() => AnimesBloc(getAllTopAnimes: sl()));

  sl.registerFactory(() => MangasBloc(getAllTopMangas: sl()));
  sl.registerFactory(() => AnimeSearchBloc(getAnimeSearch: sl()));
  sl.registerFactory(() => MangaSearchBloc(getMangaSearch: sl()));
  sl.registerFactory(
      () => AuthCubit(signInUseCases: sl(), signUpUseCase: sl()));
  //Usecases
  sl.registerLazySingleton(() => GetTopAnimesUsecase(sl()));
  sl.registerLazySingleton(() => GetTopMangasUsecase(sl()));
  sl.registerLazySingleton(() => GetAnimeSearchUsecase(sl()));
  sl.registerLazySingleton(() => GetMangaSearchUsecase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignOutUseCase(repository: sl.call()));

  //Repository
  sl.registerLazySingleton<TopAnimeRepository>(() => TopAnimeRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<TopMangaRepository>(() => TopMangaRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<AnimeSearchRepository>(
      () => AnimeSearchRepositoryImpl(
            networkInfo: sl(),
            remoteDataSource: sl(),
          ));
  sl.registerLazySingleton<MangaSearchRepository>(
      () => MangaSearchRepositoryImpl(
            networkInfo: sl(),
            remoteDataSource: sl(),
          ));
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //Datasources
  sl.registerLazySingleton<TopAnimeRemoteDataSource>(
      () => TopAnimeRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<TopMangaRemoteDataSource>(
      () => TopMangaRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AnimeSearchRemoteDataSource>(
      () => AnimeSearchRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<MangaSearchRemoteDataSource>(
      () => MangaSearchRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<FirebaseDataSource>(() => FirebaseDataSourceImpl(
        sl.call(),
        sl.call(),
      ));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
