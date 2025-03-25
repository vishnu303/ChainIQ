import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
import 'package:chainiq/features/market/data/models/global_market_data_model.dart';
import 'package:chainiq/features/market/domain/repositories/market_repository.dart';

class MarketRepositoryImp implements MarketRepository {
  final MarketRemoteDatasource marketRemoteDatasource;
  MarketRepositoryImp({required this.marketRemoteDatasource});

  @override
  Future<List<CryptoModel>> cryptoList() async {
    try {
      return await marketRemoteDatasource.cryptoList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GlobalMarketDataModel> gobalMarketData() async {
    try {
      return await marketRemoteDatasource.globalMarketData();
    } catch (e) {
      rethrow;
    }
  }
}
