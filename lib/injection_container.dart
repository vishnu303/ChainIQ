import 'package:chainiq/core/theme/cubit/theme_cubit.dart';
import 'package:chainiq/features/home/presentation/bloc/cubit/navigation_cubit.dart';
import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/data/repository/market_repository_imp.dart';
import 'package:chainiq/features/market/domain/repositories/market_repository.dart';
import 'package:chainiq/features/market/domain/usecases/crypto_list.dart';
import 'package:chainiq/features/market/domain/usecases/global_market_data.dart';
import 'package:chainiq/features/market/presentation/bloc/market_bloc.dart';
import 'package:chainiq/features/news/data/datasources/news_remote_datasource.dart';
import 'package:chainiq/features/news/data/repositories/news_repository_imp.dart';
import 'package:chainiq/features/news/domain/repositories/news_repository.dart';
import 'package:chainiq/features/news/domain/usecases/fetch_latest_news.dart';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final serviceLocator = GetIt.instance;
void initDependencies() {
  _initMarket();
  _initHome();
  _initNews();
}

void _initHome() {
  serviceLocator.registerLazySingleton(() => NavigationCubit());

  serviceLocator.registerLazySingleton(() => ThemeCubit());
}

void _initMarket() {
  serviceLocator.registerFactory<MarketRemoteDatasource>(
      () => MarketRemoteDatasourceImp(httpClient: Client()));

  serviceLocator.registerFactory<MarketRepository>(() => MarketRepositoryImp(
        marketRemoteDatasource: serviceLocator(),
      ));

  serviceLocator.registerFactory<CryptoList>(() => CryptoList(
        marketRepository: serviceLocator(),
      ));

  serviceLocator.registerFactory<GetGlobalMarketData>(() => GetGlobalMarketData(
        marketRepository: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton<MarketBloc>(() => MarketBloc(
        cryptoList: serviceLocator(),
        getGlobalMarketData: serviceLocator(),
      ));
}

void _initNews() {
  serviceLocator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImp(
      httpClient: Client(),
    ),
  );

  serviceLocator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImp(
      newsRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<FetchLatestNews>(
      () => FetchLatestNews(newsRepository: serviceLocator()));
}
