import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String type;
  final int id;
  final String name;
  final String category;

  const Category({
    required this.type,
    required this.id,
    required this.name,
    required this.category,
  });

  @override
  List<Object?> get props => [type, id, name, category];
}
