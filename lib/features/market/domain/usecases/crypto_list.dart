import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/domain/entities/crypto.dart';

class CryptoList {
  final MarketRemoteDatasource marketRemoteDatasource;
  CryptoList({required this.marketRemoteDatasource});

  Future<List<Crypto>> call() async {
    return marketRemoteDatasource.cryptoList();
  }
}
