import 'dart:convert';

import 'package:chainiq/core/constants/api_data.dart';
import 'package:chainiq/core/exception/server_exception.dart';
import 'package:chainiq/features/news/constants/constants.dart';
import 'package:chainiq/features/news/data/models/article_model.dart';
import 'package:chainiq/features/news/data/models/article_response_model.dart';

import 'package:http/http.dart' as http;
import 'package:chainiq/core/constants/constants.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<ArticleModel>> fetchLatestArticles();
}

class NewsRemoteDataSourceImp implements NewsRemoteDataSource {
  http.Client httpClient;
  NewsRemoteDataSourceImp({required this.httpClient});
  @override
  Future<List<ArticleModel>> fetchLatestArticles({
    List<String>? categoryList,
    List<String>? sourceIds,
  }) async {
    try {
      var queryParameters = {"limit": articleContentLimit, "lang": "EN"};

      if (categoryList != null) {
        queryParameters["categories"] = categoryList.join(',');
      }

      if (sourceIds != null) {
        queryParameters["source_ids"] = sourceIds.join(',');
      }

      var url = Uri.https(baseUrlCoinDesk, latestArticlesUrl, queryParameters);

      final header = {
        "Content-type": "application/json; charset=UTF-8",
        "authorization": "Apikey $coindeskApiKey",
      };

      var response = await httpClient.get(url, headers: header);
      final jsonData = jsonDecode(response.body);
      var articleResponse = ArticlesResponseModel.fromJson(jsonData);
      if (response.statusCode == 200) {
        return articleResponse.articles as List<ArticleModel>;
      }
      throw ServerException(
        message: articleResponse.err.message!,
        statusCode: response.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }
}
