import 'package:cinema_hub/core/utils/api.dart';
import 'package:cinema_hub/features/home/data/data_source/home_remote_data_source.dart';
import 'package:cinema_hub/features/home/data/repo/home_repo_impl.dart';
import 'package:cinema_hub/features/home/domain/repo/home_repo.dart';
import 'package:cinema_hub/features/home/domain/use_cases/get_home_list_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register Dio instance
  locator.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    )..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      )),
  );

  // Register API client
  locator.registerLazySingleton<Api>(
    () => Api(locator<Dio>()),
  );

  // Register Data Sources
  locator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(locator<Api>()),
  );

  // Register Repositories
  locator.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(locator<HomeRemoteDataSource>()),
  );

  // Register Use Cases
  locator.registerLazySingleton<GetHomeListUseCase>(
    () => GetHomeListUseCase(locator<HomeRepo>()),
  );

  //
}
