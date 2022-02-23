class AppException implements Exception {
  AppException({
    required this.message,
  });

  final String message;
}
