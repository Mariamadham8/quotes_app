import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/random_quotes/data/data_sources/random_quote_local_datasource.dart';
import '../../features/random_quotes/data/data_sources/random_quote_remote_datasource.dart';
import '../../features/random_quotes/data/repos/qoute_repo_impl.dart';
import '../../features/random_quotes/domain/repos/get_random_quote.dart';
import '../../features/random_quotes/domain/usecases/get_random_quote.dart';
import '../../features/random_quotes/presentation/manager/random_quote_cubit.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<Dio>(() => Dio());

  // Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Data sources
  sl.registerLazySingleton<RandomQuoteLocalDatasource>(
    () => RandomQuoteLocalDatasourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<RandomQuoteRemoteDatasource>(
    () => RandomQuoteRemoteDatasourceImpl(dio: sl()),
  );

  // Repo
  sl.registerLazySingleton<QuoteRepo>(() => QouteRepoImpl(sl(), sl(), sl()));

  // Use case
  sl.registerLazySingleton(() => GetRandomQuote(sl()));

  // Cubit
  sl.registerFactory(() => RandomQuoteCubit(sl()));
}
