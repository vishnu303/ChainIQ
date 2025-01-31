import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/data/repository/market_repository_imp.dart';
import 'package:chainiq/features/market/domain/repositories/market_repository.dart';
import 'package:chainiq/features/market/domain/usecases/crypto_list.dart';
import 'package:chainiq/features/market/presentation/bloc/market_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void initDependencies() {
  _initMarket();
}

void _initMarket() {
  serviceLocator.registerFactory<MarketRemoteDatasource>(
      () => MarketRemoteDatasourceImp());
  serviceLocator.registerFactory<MarketRepository>(() => MarketRepositoryImp(
        marketRemoteDatasource: serviceLocator(),
      ));
  serviceLocator.registerFactory(() => CryptoList(
        marketRemoteDatasource: serviceLocator(),
      ));

  serviceLocator.registerLazySingleton(() => MarketBloc(
        cryptoList: serviceLocator(),
      ));
}
