import 'package:chainiq/features/market/domain/entities/crypto.dart';
import 'package:chainiq/features/market/domain/repositories/market_repository.dart';

class CryptoList {
  final MarketRepository marketRepository;
  CryptoList({required this.marketRepository});

  Future<List<Crypto>> call() async {
    return await marketRepository.cryptoList();
  }
}
