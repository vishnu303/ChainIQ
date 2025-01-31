import 'package:chainiq/features/market/domain/entities/crypto.dart';
import 'package:chainiq/features/market/presentation/widgets/custom_crypto_list_item.dart';
import 'package:flutter/material.dart';

class CryptoListWidget extends StatelessWidget {
  final List<Crypto> cryptoList;
  const CryptoListWidget({
    super.key,
    required this.cryptoList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(flex: 2, child: Text('Rank')),
              Expanded(flex: 3, child: Text('Name')),
              Expanded(flex: 2, child: Text('Price')),
              Expanded(flex: 2, child: Text('24h %')),
              Expanded(flex: 2, child: Text('Market Cap')),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cryptoList.length,
              itemBuilder: (context, index) {
                return CryptoListItem(
                  crypto: cryptoList[index],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
