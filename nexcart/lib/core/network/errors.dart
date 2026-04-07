enum AppException implements Exception {
  network('No internet connection. Please check your network.'),
  unauthorised('Invalid username or password.'),
  rateLimit('Too many attempts. Please wait a moment.'),
  server('Something went wrong. Please try again later.'),
  timeout('Request timed out. Please try again.'),
  unknown('An unexpected error occurred.');

  final String message;
  const AppException(this.message);

  @override
  String toString() => message;
}