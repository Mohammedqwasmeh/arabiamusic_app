class ServerFailure {
  ServerFailure({
    required this.errors,
    required this.statusCode,
  });

  final Map<String, dynamic> errors;
  final int statusCode;
}
