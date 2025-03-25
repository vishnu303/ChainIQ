import 'package:chainiq/core/constants/api_data.dart';
import 'package:chainiq/core/constants/constants.dart';
import 'package:chainiq/core/exception/server_exception.dart';
import 'package:chainiq/features/market/constants/constants.dart';
import 'package:chainiq/features/market/data/models/crypto_failure_response_model.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
import 'package:chainiq/features/market/data/models/global_market_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract interface class MarketRemoteDatasource {
  Future<List<CryptoModel>> cryptoList();
  Future<GlobalMarketDataModel> globalMarketData();
}

class MarketRemoteDatasourceImp implements MarketRemoteDatasource {
  final http.Client httpClient;
  MarketRemoteDatasourceImp({required this.httpClient});

  /// Get list of crypto by market cap
  @override
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
      if (response.statusCode == 200) {
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

  /// Get Global market data
  @override
  Future<GlobalMarketDataModel> globalMarketData() async {
    try {
      var params = {
        "x-cg-demo-api-key": apiKey,
      };
      var url = Uri.https(baseUrl, globaldataUrl, params);
      var response = await httpClient.get(url);
      var jsonResponse = jsonDecode(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint(response.body);
        return GlobalMarketDataModel.fromJson(jsonResponse);
      } else {
        var errorResponse = CryptoFailureResposne.fromMap(jsonResponse);
        throw ServerException(
            message: errorResponse.status.errorMessage,
            statusCode: errorResponse.status.errorCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
