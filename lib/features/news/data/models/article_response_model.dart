import 'dart:convert';

import 'package:chainiq/features/news/data/models/article_error_response_model.dart';
import 'package:chainiq/features/news/domain/entities/article_response.dart';

import 'article_model.dart';

ArticlesResponse articlesResponseFromJson(String str) =>
    ArticlesResponseModel.fromJson(json.decode(str));

class ArticlesResponseModel extends ArticlesResponse {
  const ArticlesResponseModel({
    required super.articles,
    required super.err,
  });

  factory ArticlesResponseModel.fromJson(Map<String, dynamic> json) =>
      ArticlesResponseModel(
        articles: (json['Data'] as List? ?? [])
            .map((x) => ArticleModel.fromJson(x))
            .toList(),
        err: ErrModel.fromJson(json['Err'] ?? {}),
      );
}
