import '../../domain/entities/article.dart';
import 'category_model.dart';
import 'source_model.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.type,
    required super.id,
    required super.guid,
    required super.publishedOn,
    required super.imageUrl,
    required super.title,
    super.subtitle,
    required super.authors,
    required super.url,
    required super.sourceId,
    required super.body,
    required super.keywords,
    required super.language,
    required super.upvotes,
    required super.downvotes,
    required super.score,
    required super.sentiment,
    required super.status,
    required super.createdOn,
    required super.updatedOn,
    required super.source,
    required super.categories,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        type: json['TYPE'] ?? '',
        id: json['ID'] as int? ?? 0,
        guid: json['GUID'] ?? '',
        publishedOn: DateTime.fromMillisecondsSinceEpoch(
          json['PUBLISHED_ON'] as int? ?? 0,
        ),
        imageUrl: json['IMAGE_URL'] ?? '',
        title: json['TITLE'] ?? '',
        subtitle: json['SUBTITLE'] as String?,
        authors: json['AUTHORS'] ?? '',
        url: json['URL'] ?? '',
        sourceId: json['SOURCE_ID'] as int? ?? 0,
        body: json['BODY'] ?? '',
        keywords: json['KEYWORDS'] ?? '',
        language: json['LANG'] ?? 'en',
        upvotes: json['UPVOTES'] as int? ?? 0,
        downvotes: json['DOWNVOTES'] as int? ?? 0,
        score: json['SCORE'] as int? ?? 0,
        sentiment: _parseSentiment(json['SENTIMENT']),
        status: _parseStatus(json['STATUS']),
        createdOn: DateTime.fromMillisecondsSinceEpoch(
          json['CREATED_ON'] as int? ?? 0,
        ),
        updatedOn: DateTime.fromMillisecondsSinceEpoch(
          json['UPDATED_ON'] as int? ?? 0,
        ),
        source: SourceModel.fromJson(json['SOURCE_DATA'] ?? {}),
        categories: (json['CATEGORY_DATA'] as List? ?? [])
            .map((x) => CategoryModel.fromJson(x))
            .toList(),
      );

  static Sentiment _parseSentiment(String? value) =>
      Sentiment.values.firstWhere(
        (e) => e.name == value?.toLowerCase(),
        orElse: () => Sentiment.neutral,
      );

  static Status _parseStatus(String? value) => Status.values.firstWhere(
        (e) => e.name == value?.toLowerCase(),
        orElse: () => Status.published,
      );
}
