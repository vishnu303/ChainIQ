class GlobalMarketData {
  final int activeCryptocurrencies;
  final int upcomingIcos;
  final int ongoingIcos;
  final int endedIcos;
  final int markets;
  final Map<String, double> totalMarketCap;
  final Map<String, double> totalVolume;
  final Map<String, double> marketCapPercentage;
  final double marketCapChangePercentage24hUsd;
  final int updatedAt;

  GlobalMarketData({
    required this.activeCryptocurrencies,
    required this.upcomingIcos,
    required this.ongoingIcos,
    required this.endedIcos,
    required this.markets,
    required this.totalMarketCap,
    required this.totalVolume,
    required this.marketCapPercentage,
    required this.marketCapChangePercentage24hUsd,
    required this.updatedAt,
  });
}
