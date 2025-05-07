import 'package:chainiq/features/news/domain/entities/article_error_response.dart';

class ErrModel extends Err {
  const ErrModel({super.message});

  factory ErrModel.fromJson(Map<String, dynamic> json) => ErrModel(
        message: json['message'] as String?,
      );
}
