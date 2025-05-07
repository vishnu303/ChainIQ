import 'package:chainiq/features/news/domain/entities/article.dart';

abstract interface class NewsRepository {
  /// Fetch latest news articles
  Future<List<Article>> fetchLatestArticles();
}
