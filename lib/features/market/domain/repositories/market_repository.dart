import 'package:chainiq/features/market/domain/entities/crypto.dart';
import 'package:chainiq/features/market/domain/entities/global_market_data.dart';

abstract interface class MarketRepository {
  /// Crypto currency list by market cap
  Future<List<Crypto>> cryptoList();

  /// Global crypto market data
  Future<GlobalMarketData> gobalMarketData();
}
