import 'dart:convert';

import 'package:chainiq/features/market/data/datasource/market_remote_datasource.dart';
import 'package:chainiq/features/market/data/models/crypto_model.dart';
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

  group('CryptoList tests -', () {
    test('should return crypto list when API call is successful', () async {
      // Arrange

      when(mockHttpClient.get(any)).thenAnswer(
          (_) async => http.Response(jsonEncode(mockJsondata), 200));

      // Act
      final result = await marketRemoteDatasource.cryptoList();

      // Assert
      expect(result, isA<List<CryptoModel>>());
    });
    test('should throw an exception when API call is unsuccessful', () async {
      // Arrange
      when(mockHttpClient.get(any))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // Act
      final call = marketRemoteDatasource.cryptoList;

      // Assert
      expect(call, throwsA(isA<Exception>()));
    });
  });
}
