import 'package:chainiq/features/market/domain/entities/global_market_data.dart';

class GlobalMarketDataModel extends GlobalMarketData {
  GlobalMarketDataModel({
    required super.activeCryptocurrencies,
    required super.upcomingIcos,
    required super.ongoingIcos,
    required super.endedIcos,
    required super.markets,
    required super.totalMarketCap,
    required super.totalVolume,
    required super.marketCapPercentage,
    required super.marketCapChangePercentage24hUsd,
    required super.updatedAt,
  });

  factory GlobalMarketDataModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return GlobalMarketDataModel(
      activeCryptocurrencies: data['active_cryptocurrencies'] ?? 0,
      upcomingIcos: data['upcoming_icos'] ?? 0,
      ongoingIcos: data['ongoing_icos'] ?? 0,
      endedIcos: data['ended_icos'] ?? 0,
      markets: data['markets'] ?? 0,
      totalMarketCap: _convertToDoubleMap(data['total_market_cap'] ?? {}),
      totalVolume: _convertToDoubleMap(data['total_volume'] ?? {}),
      marketCapPercentage:
          _convertToDoubleMap(data['market_cap_percentage'] ?? {}),
      marketCapChangePercentage24hUsd:
          (data['market_cap_change_percentage_24h_usd'] ?? 0).toDouble(),
      updatedAt: data['updated_at'] ?? 0,
    );
  }

  static Map<String, double> _convertToDoubleMap(Map<String, dynamic> map) {
    return map.map((key, value) => MapEntry(key, (value as num).toDouble()));
  }
}
