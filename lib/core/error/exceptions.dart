class CacheException implements Exception {
  final String message;

  const CacheException([this.message = 'Cache error occurred']);
}

class ServerException implements Exception {
  final String message;

  const ServerException([this.message = 'Server error occurred']);
}
