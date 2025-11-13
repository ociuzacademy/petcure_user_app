class EmptyCartException implements Exception {
  final String message;
  EmptyCartException(this.message);

  @override
  String toString() => message;
}
