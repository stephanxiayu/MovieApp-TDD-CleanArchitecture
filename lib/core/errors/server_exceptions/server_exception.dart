class ServerException implements Exception{
  final String message;

  ServerException(String s, { this.message = "Server error"}); 
}