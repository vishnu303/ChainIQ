import 'package:chainiq/core/constants/api_data.dart';
import 'package:chainiq/core/constants/constants.dart';
import 'package:chainiq/core/exception/server_exception.dart';
import 'package:chainiq/features/market/constants/constants.dart';
import 'package:chainiq/features/market/data/models/crypto_failure_response_model.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract interface class MarketRemoteDatasource {
  Future<List<CryptoModel>> cryptoList();
}

class MarketRemoteDatasourceImp implements MarketRemoteDatasource {
  final http.Client httpClient;
  MarketRemoteDatasourceImp({required this.httpClient});
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
      var response = await httpClient.get(url);
      final jsonResponse = jsonDecode(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return (jsonResponse as List)
            .map((json) => CryptoModel.fromMap(json))
            .toList();
      }

      var errorResponse = CryptoFailureResposne.fromMap(jsonResponse);
      throw ServerException(
        message: errorResponse.status.errorMessage,
        statusCode: errorResponse.status.errorCode,
      );
    } catch (e) {
      rethrow;
    }
  }
}
