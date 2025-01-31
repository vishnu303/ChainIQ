import 'package:chainiq/core/constants/api_data.dart';
import 'package:chainiq/core/constants/constants.dart';
import 'package:chainiq/features/market/constants/constants.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract interface class MarketRemoteDatasource {
  Future<List<CryptoModel>> cryptoList();
}

class MarketRemoteDatasourceImp implements MarketRemoteDatasource {
  @override

  /// Get list of crypto by market cap
  Future<List<CryptoModel>> cryptoList() async {
    try {
      var param = {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        "x-cg-demo-api-key": apiKey,
      };
      var url = Uri.https(baseUrl, cryptoListUrl, param);
      var response = await http.get(url);
      List<dynamic> jsonList = jsonDecode(response.body);
      debugPrint(response.body);
      return jsonList.map((json) => CryptoModel.fromMap(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
