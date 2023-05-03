import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/top_anime/data/data_sources/top_anime_remote_data_source.dart';
import 'features/top_anime/data/repositories/top_anime_repository_impl.dart';
import 'features/top_anime/domain/repositories/top_anime_repository.dart';
import 'features/top_anime/domain/use_cases/get_top_animes.dart';
import 'features/top_anime/presentation/anime/animes_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features: posts

  //Bloc
  sl.registerFactory(() => AnimesBloc(getAllTopAnimes: sl()));
  //Usecases
  sl.registerLazySingleton(() => GetTopAnimesUsecase(sl()));

  //Repository
  sl.registerLazySingleton<TopAnimeRepository>(() => TopAnimeRepositoryImpl(
        networkInfo: sl(),
        remoteDataSource: sl(),
      ));

  //Datasources
  sl.registerLazySingleton<TopAnimeRemoteDataSource>(
      () => TopAnimeRemoteDataSourceImpl(client: sl()));
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
