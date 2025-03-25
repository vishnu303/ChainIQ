import 'package:chainiq/features/market/domain/entities/global_market_data.dart';
import 'package:chainiq/features/market/domain/repositories/market_repository.dart';

class GetGlobalMarketData {
  final MarketRepository marketRepository;
  GetGlobalMarketData({required this.marketRepository});
  Future<GlobalMarketData> call() async {
    return await marketRepository.gobalMarketData();
  }
}
