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
  serviceLocator.registerLazySingleton<Client>(() => Client());

  _initMarket();
  _initHome();
  _initNews();
}

void _initHome() {
  serviceLocator.registerFactory(() => NavigationCubit());

  serviceLocator.registerFactory(() => ThemeCubit());
}

void _initMarket() {
  serviceLocator.registerLazySingleton<MarketRemoteDatasource>(
      () => MarketRemoteDatasourceImp(httpClient: serviceLocator<Client>()));

  serviceLocator
      .registerLazySingleton<MarketRepository>(() => MarketRepositoryImp(
            marketRemoteDatasource: serviceLocator<MarketRemoteDatasource>(),
          ));

  serviceLocator.registerLazySingleton<CryptoList>(() => CryptoList(
        marketRepository: serviceLocator<MarketRepository>(),
      ));

  serviceLocator
      .registerLazySingleton<GetGlobalMarketData>(() => GetGlobalMarketData(
            marketRepository: serviceLocator<MarketRepository>(),
          ));

  serviceLocator.registerFactory<MarketBloc>(() => MarketBloc(
        cryptoList: serviceLocator<CryptoList>(),
        getGlobalMarketData: serviceLocator<GetGlobalMarketData>(),
      ));
}

void _initNews() {
  serviceLocator.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImp(
      httpClient: serviceLocator<Client>(),
    ),
  );

  serviceLocator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImp(
      newsRemoteDataSource: serviceLocator<NewsRemoteDataSource>(),
    ),
  );

  serviceLocator.registerLazySingleton<FetchLatestNews>(
      () => FetchLatestNews(newsRepository: serviceLocator<NewsRepository>()));
}
