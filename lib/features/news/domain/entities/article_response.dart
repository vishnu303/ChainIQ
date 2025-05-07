import 'package:chainiq/features/news/domain/entities/article_error_response.dart';
import 'package:equatable/equatable.dart';
import 'article.dart';

class ArticlesResponse extends Equatable {
  final List<Article> articles;
  final Err err;

  const ArticlesResponse({
    required this.articles,
    required this.err,
  });

  @override
  List<Object?> get props => [articles, err];
}
