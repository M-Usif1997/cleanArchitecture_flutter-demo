import 'package:clean_architecture_posts_app/featutes/posts/domain/repositories/posts_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'featutes/posts/data/datasources/post_local_data_source.dart';
import 'featutes/posts/data/datasources/post_remote_data_source.dart';
import 'featutes/posts/data/repositories/post_repository_impl.dart';
import 'featutes/posts/domain/usecases/add_post.dart';
import 'featutes/posts/domain/usecases/delete_post.dart';
import 'featutes/posts/domain/usecases/get_all_posts.dart';
import 'featutes/posts/domain/usecases/update_post.dart';
import 'featutes/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'featutes/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), deletePost: sl(), updatePost: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));

  //Repository
sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
  networkInfo: sl(),
  remoteDataSource: sl(),
  localDataSource: sl(),
));


  //DataSources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<PostLocalDataSource>(
          () => PostLocalDataSourceImpl(sharedPreferences: sl()));


  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  //!External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(()=> InternetConnectionChecker());
}
