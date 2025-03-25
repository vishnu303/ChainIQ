import 'package:chainiq/features/market/domain/entities/crypto.dart';

class CryptoModel extends Crypto {
  CryptoModel({
    required super.id,
    required super.symbol,
    required super.name,
    required super.image,
    required super.currentPrice,
    required super.marketCap,
    required super.marketCapRank,
    required super.fullyDilutedValuation,
    required super.totalVolume,
    required super.high24H,
    required super.low24H,
    required super.priceChange24H,
    required super.priceChangePercentage24H,
    required super.marketCapChange24H,
    required super.marketCapChangePercentage24H,
    required super.circulatingSupply,
    required super.totalSupply,
    super.maxSupply,
    required super.ath,
    required super.athChangePercentage,
    required super.athDate,
    required super.atl,
    required super.atlChangePercentage,
    required super.atlDate,
    super.roi,
    required super.lastUpdated,
  });

  factory CryptoModel.fromMap(Map<String, dynamic> json) => CryptoModel(
        id: json["id"] ?? '',
        symbol: json["symbol"] ?? '',
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"]?.toDouble() ?? 0,
        marketCap: json["market_cap"].toInt() ?? 0,
        marketCapRank: json["market_cap_rank"]?.toInt() ?? 0,
        fullyDilutedValuation: json["fully_diluted_valuation"]?.toInt() ?? 0,
        totalVolume: json["total_volume"]?.toInt() ?? 0,
        high24H: json["high_24h"]?.toDouble() ?? 0,
        low24H: json["low_24h"]?.toDouble() ?? 0,
        priceChange24H: json["price_change_24h"]?.toDouble() ?? 0,
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble() ?? 0,
        marketCapChange24H: json["market_cap_change_24h"]?.toDouble() ?? 0,
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"]?.toDouble() ?? 0,
        circulatingSupply: json["circulating_supply"]?.toDouble() ?? 0,
        totalSupply: json["total_supply"]?.toDouble() ?? 0,
        maxSupply: json["max_supply"]?.toInt() ?? 0,
        ath: json["ath"]?.toDouble() ?? 0,
        athChangePercentage: json["ath_change_percentage"]?.toDouble() ?? 0,
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"]?.toDouble() ?? 0,
        atlChangePercentage: json["atl_change_percentage"]?.toDouble() ?? 0,
        atlDate: DateTime.parse(json["atl_date"]),
        roi: json["roi"] == null ? null : RoiModel.fromMap(json["roi"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
      );
}

class RoiModel extends Roi {
  RoiModel({
    required super.times,
    required super.currency,
    required super.percentage,
  });

  factory RoiModel.fromMap(Map<String, dynamic> json) => RoiModel(
        times: json["times"]?.toDouble() ?? 0,
        currency: json["currency"] ?? '',
        percentage: json["percentage"]?.toDouble() ?? 0,
      );
}
