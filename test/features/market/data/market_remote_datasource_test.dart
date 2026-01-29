import 'dart:convert';

import 'package:chainiq/core/exception/server_exception.dart';
import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
import 'package:chainiq/features/market/data/models/global_market_data_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../constants/constants.dart';
import 'market_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MarketRemoteDatasource marketRemoteDatasource;
  late MockClient mockHttpClient;

  setUp(() async {
    mockHttpClient = MockClient();
    marketRemoteDatasource =
        MarketRemoteDatasourceImp(httpClient: mockHttpClient);
    await dotenv.load(fileName: '.env');
  });

  group('cryptoList -', () {
    test('returns List<CryptoModel> when status code is 200', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(mockJsondata), 200),
      );

      // Act
      final result = await marketRemoteDatasource.cryptoList();

      // Assert
      expect(result, isA<List<CryptoModel>>());
      expect(result.length, 1);
      expect(result.first.id, 'bitcoin');
      expect(result.first.symbol, 'btc');
      expect(result.first.name, 'Bitcoin');
      expect(result.first.currentPrice, 98673);
      verify(mockHttpClient.get(any)).called(1);
    });

    test('returns empty list when API returns empty array', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode([]), 200),
      );

      // Act
      final result = await marketRemoteDatasource.cryptoList();

      // Assert
      expect(result, isA<List<CryptoModel>>());
      expect(result, isEmpty);
    });

    test('throws ServerException when API returns error response', () async {
      // Arrange
      final errorResponse = {
        'status': {
          'error_code': 429,
          'error_message': 'Rate limit exceeded',
        }
      };
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(errorResponse), 429),
      );

      // Act & Assert
      expect(
        () => marketRemoteDatasource.cryptoList(),
        throwsA(
          isA<ServerException>()
              .having((e) => e.statusCode, 'statusCode', 429)
              .having((e) => e.message, 'message', 'Rate limit exceeded'),
        ),
      );
    });

    test('throws FormatException when API returns malformed JSON', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('not valid json', 200),
      );

      // Act & Assert
      expect(
        () => marketRemoteDatasource.cryptoList(),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('globalMarketData -', () {
    test('returns GlobalMarketDataModel when status code is 200', () async {
      // Arrange
      final mockGlobalData = {
        'data': {
          'active_cryptocurrencies': 15000,
          'upcoming_icos': 10,
          'ongoing_icos': 50,
          'ended_icos': 3000,
          'markets': 900,
          'total_market_cap': {'usd': 2500000000000.0},
          'total_volume': {'usd': 100000000000.0},
          'market_cap_percentage': {'btc': 50.5, 'eth': 15.2},
          'market_cap_change_percentage_24h_usd': 1.5,
          'updated_at': 1700000000,
        }
      };
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(mockGlobalData), 200),
      );

      // Act
      final result = await marketRemoteDatasource.globalMarketData();

      // Assert
      expect(result, isA<GlobalMarketDataModel>());
      expect(result.activeCryptocurrencies, 15000);
      expect(result.markets, 900);
      expect(result.marketCapChangePercentage24hUsd, 1.5);
      verify(mockHttpClient.get(any)).called(1);
    });

    test('throws ServerException when API returns error response', () async {
      // Arrange
      final errorResponse = {
        'status': {
          'error_code': 500,
          'error_message': 'Internal server error',
        }
      };
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(errorResponse), 500),
      );

      // Act & Assert
      expect(
        () => marketRemoteDatasource.globalMarketData(),
        throwsA(
          isA<ServerException>()
              .having((e) => e.statusCode, 'statusCode', 500)
              .having((e) => e.message, 'message', 'Internal server error'),
        ),
      );
    });

    test('throws FormatException when API returns malformed JSON', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response('invalid json', 200),
      );

      // Act & Assert
      expect(
        () => marketRemoteDatasource.globalMarketData(),
        throwsA(isA<FormatException>()),
      );
    });

    test('handles missing data fields gracefully', () async {
      // Arrange
      final incompleteData = {
        'data': {
          'active_cryptocurrencies': 100,
          'total_market_cap': {'usd': 1000.0},
          'total_volume': {'usd': 500.0},
          'market_cap_percentage': {'btc': 60.0},
        }
      };
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(incompleteData), 200),
      );

      // Act
      final result = await marketRemoteDatasource.globalMarketData();

      // Assert
      expect(result, isA<GlobalMarketDataModel>());
      expect(result.activeCryptocurrencies, 100);
      expect(result.upcomingIcos, 0);
      expect(result.ongoingIcos, 0);
    });
  });
}
