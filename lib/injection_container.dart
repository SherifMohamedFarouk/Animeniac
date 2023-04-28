import 'core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features: posts

  // //Bloc
  // sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  // sl.registerFactory(() => AddDeleteUpdatePostBloc(
  //       addPost: sl(),
  //       deletePost: sl(),
  //       updatePost: sl(),
  //     ));
  // //Usecases
  // sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  // sl.registerLazySingleton(() => AddPostUsecase(sl()));
  // sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  // sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
  // //Repository
  // sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
  //     networkInfo: sl(), remoteDataSource: sl(), localDataSource: sl()));

  // //Datasources
  // sl.registerLazySingleton<PostRemoteDataSource>(
  //     () => PostRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<PostLocalDataSource>(
  //     () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
