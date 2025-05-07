import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.type,
    required super.id,
    required super.name,
    required super.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        type: json['TYPE'] ?? '',
        id: json['ID'] as int? ?? 0,
        name: json['NAME'] ?? '',
        category: json['CATEGORY'] ?? '',
      );
}
