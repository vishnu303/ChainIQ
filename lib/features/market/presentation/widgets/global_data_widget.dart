import 'package:chainiq/features/market/domain/entities/global_market_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalDataWidget extends StatelessWidget {
  final GlobalMarketData globalMarketData;
  const GlobalDataWidget({
    super.key,
    required this.globalMarketData,
  });

  @override
  Widget build(BuildContext context) {
    final marketCapFormat = NumberFormat.compactCurrency(
      symbol: '\$',
      decimalDigits: 2,
    );
    final totMarketcap =
        marketCapFormat.format(globalMarketData.totalMarketCap['usd']);
    final dominance = globalMarketData.marketCapPercentage['btc'];
    final volume = marketCapFormat.format(globalMarketData.totalVolume['usd']);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildMarketCard('Market Cap', totMarketcap),
        ),
        Expanded(
          child: _buildMarketCard(' 24hr Volume', volume),
        ),
        Expanded(
          child: _buildMarketCard(
            'Dominance',
            'BTC ${dominance?.toStringAsFixed(2)} %',
          ),
        ),
      ],
    );
  }

  Widget _buildMarketCard(String title, String value) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
