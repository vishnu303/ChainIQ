import 'package:chainiq/features/market/domain/entities/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoListItem extends StatelessWidget {
  final Crypto crypto;
  final int index;
  const CryptoListItem({
    super.key,
    required this.crypto,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    final marketCapFormat = NumberFormat.compactCurrency(
      symbol: '\$',
      decimalDigits: 2,
    );
    final percentageFormat =
        NumberFormat.decimalPatternDigits(decimalDigits: 2);
    final cryptoRank = index + 1;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              cryptoRank.toString(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(crypto.image, scale: 3),
                ),
                Text(
                  crypto.symbol,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(priceFormat.format(crypto.currentPrice)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${percentageFormat.format(crypto.priceChangePercentage24H)}%',
              style: TextStyle(
                color: 2 >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(marketCapFormat.format(crypto.marketCap)),
          ),
        ],
      ),
    );
  }
}
