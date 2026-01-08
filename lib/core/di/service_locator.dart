import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes_app/features/fav_quotes/presentation/cubit/add_quote_cubit.dart';
import 'package:quotes_app/features/splash_screen/data/datasource/lang_local_data_source.dart';
import 'package:quotes_app/features/splash_screen/data/repository/lang_repo_imple.dart';
import 'package:quotes_app/features/splash_screen/domain/repositories/lang_repo.dart';
import 'package:quotes_app/features/splash_screen/domain/usecases/change_lang.dart';
import 'package:quotes_app/features/splash_screen/domain/usecases/get_saved_lang.dart';
import 'package:quotes_app/features/splash_screen/presentation/manger/cubit/locale_cubit.dart';
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

  sl.registerLazySingleton<LnagLocalDataSource>(
    () => LangLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<RandomQuoteRemoteDatasource>(
    () => RandomQuoteRemoteDatasourceImpl(dio: sl()),
  );

  // Repo
  sl.registerLazySingleton<QuoteRepo>(() => QouteRepoImpl(sl(), sl(), sl()));

  sl.registerLazySingleton<LnagRepo>(
    () => LangRepeImple(langLocalDataSource: sl()),
  );

  // Use case
  sl.registerLazySingleton(() => GetRandomQuote(sl()));

  sl.registerLazySingleton(() => ChangeLangUsecase(sl()));
  sl.registerLazySingleton(() => GetSavedLangUsecase(sl()));

  // Cubit
  sl.registerFactory(() => RandomQuoteCubit(sl()));
  sl.registerFactory(() => LocaleCubit(getSavedLangUsecase: sl()));

  sl.registerLazySingleton(() => AddQuoteCubit());
}
