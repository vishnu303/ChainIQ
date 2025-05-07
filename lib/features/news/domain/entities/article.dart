import 'package:equatable/equatable.dart';

import 'category.dart';
import 'source.dart';

enum Sentiment { positive, negative, neutral }

enum Status { published, draft, archived }

class Article extends Equatable {
  final String type;
  final int id;
  final String guid;
  final DateTime publishedOn;
  final String imageUrl;
  final String title;
  final String? subtitle;
  final String authors;
  final String url;
  final int sourceId;
  final String body;
  final String keywords;
  final String language;
  final int upvotes;
  final int downvotes;
  final int score;
  final Sentiment sentiment;
  final Status status;
  final DateTime createdOn;
  final DateTime updatedOn;
  final Source source;
  final List<Category> categories;

  const Article({
    required this.type,
    required this.id,
    required this.guid,
    required this.publishedOn,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    required this.authors,
    required this.url,
    required this.sourceId,
    required this.body,
    required this.keywords,
    required this.language,
    required this.upvotes,
    required this.downvotes,
    required this.score,
    required this.sentiment,
    required this.status,
    required this.createdOn,
    required this.updatedOn,
    required this.source,
    required this.categories,
  });

  @override
  List<Object?> get props => [
        type,
        id,
        guid,
        publishedOn,
        imageUrl,
        title,
        subtitle,
        authors,
        url,
        sourceId,
        body,
        keywords,
        language,
        upvotes,
        downvotes,
        score,
        sentiment,
        status,
        createdOn,
        updatedOn,
        source,
        categories,
      ];
}
