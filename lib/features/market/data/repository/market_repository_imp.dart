import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
import 'package:chainiq/features/market/domain/repositories/market_repository.dart';

class MarketRepositoryImp implements MarketRepository {
  final MarketRemoteDatasource marketRemoteDatasource;
  MarketRepositoryImp({required this.marketRemoteDatasource});

  @override
  Future<List<CryptoModel>> cryptoList() async {
    try {
      var cryptoList = await marketRemoteDatasource.cryptoList();
      return cryptoList;
    } catch (e) {
      rethrow;
    }
  }
}
