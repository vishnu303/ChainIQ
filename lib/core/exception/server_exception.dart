class ServerException implements Exception {
  final int? statusCode;
  final String message;
  ServerException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'Exception: $message (Status: $statusCode)';
}
