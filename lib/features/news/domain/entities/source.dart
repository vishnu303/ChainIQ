import 'package:equatable/equatable.dart';

enum SourceType { news, blog, journal }

enum Status { published, draft, archived }

class Source extends Equatable {
  final String type;
  final int id;
  final String sourceKey;
  final String name;
  final String imageUrl;
  final String url;
  final String language;
  final SourceType sourceType;
  final String? launchDate;
  final int sortOrder;
  final int benchmarkScore;
  final Status status;
  final DateTime lastUpdated;
  final DateTime createdOn;
  final DateTime updatedOn;

  const Source({
    required this.type,
    required this.id,
    required this.sourceKey,
    required this.name,
    required this.imageUrl,
    required this.url,
    required this.language,
    required this.sourceType,
    this.launchDate,
    required this.sortOrder,
    required this.benchmarkScore,
    required this.status,
    required this.lastUpdated,
    required this.createdOn,
    required this.updatedOn,
  });

  @override
  List<Object?> get props => [
        type,
        id,
        sourceKey,
        name,
        imageUrl,
        url,
        language,
        sourceType,
        launchDate,
        sortOrder,
        benchmarkScore,
        status,
        lastUpdated,
        createdOn,
        updatedOn,
      ];
}
