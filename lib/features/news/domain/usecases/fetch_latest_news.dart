import 'package:chainiq/features/news/domain/entities/article.dart';
import 'package:chainiq/features/news/domain/repositories/news_repository.dart';

class FetchLatestNews {
  final NewsRepository newsRepository;
  FetchLatestNews({required this.newsRepository});

  Future<List<Article>> call() async {
    return await newsRepository.fetchLatestArticles();
  }
}
