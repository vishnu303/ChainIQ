import '../../domain/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({
    required super.type,
    required super.id,
    required super.sourceKey,
    required super.name,
    required super.imageUrl,
    required super.url,
    required super.language,
    required super.sourceType,
    super.launchDate,
    required super.sortOrder,
    required super.benchmarkScore,
    required super.status,
    required super.lastUpdated,
    required super.createdOn,
    required super.updatedOn,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        type: json['TYPE'] ?? '',
        id: json['ID'] as int? ?? 0,
        sourceKey: json['SOURCE_KEY'] ?? '',
        name: json['NAME'] ?? '',
        imageUrl: json['IMAGE_URL'] ?? '',
        url: json['URL'] ?? '',
        language: json['LANG'] ?? 'en',
        sourceType: _parseSourceType(json['SOURCE_TYPE']),
        launchDate: json['LAUNCH_DATE']?.toString(),
        sortOrder: json['SORT_ORDER'] as int? ?? 0,
        benchmarkScore: json['BENCHMARK_SCORE'] as int? ?? 0,
        status: _parseStatus(json['STATUS']),
        lastUpdated: DateTime.fromMillisecondsSinceEpoch(
          json['LAST_UPDATED_TS'] is int ? json['LAST_UPDATED_TS'] : 0,
        ),
        createdOn: DateTime.fromMillisecondsSinceEpoch(
          json['CREATED_ON'] is int ? json['CREATED_ON'] : 0,
        ),
        updatedOn: DateTime.fromMillisecondsSinceEpoch(
          json['UPDATED_ON'] is int ? json['UPDATED_ON'] : 0,
        ),
      );

  static SourceType _parseSourceType(String? value) =>
      SourceType.values.firstWhere(
        (e) => e.name == value?.toLowerCase(),
        orElse: () => SourceType.news,
      );

  static Status _parseStatus(String? value) => Status.values.firstWhere(
        (e) => e.name == value?.toLowerCase(),
        orElse: () => Status.published,
      );
}
