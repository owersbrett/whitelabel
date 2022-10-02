class NotFound<T> implements Exception {
  @override
  String toString() {
    return "404 ${T.runtimeType} not found";
  }
}
