import 'package:chainiq/features/news/data/datasources/news_remote_datasource.dart';
import 'package:chainiq/features/news/domain/entities/article.dart';
import 'package:chainiq/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImp implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImp({
    required this.newsRemoteDataSource,
  });
  @override
  Future<List<Article>> fetchLatestArticles() async {
    try {
      return await newsRemoteDataSource.fetchLatestArticles();
    } catch (e) {
      rethrow;
    }
  }
}
