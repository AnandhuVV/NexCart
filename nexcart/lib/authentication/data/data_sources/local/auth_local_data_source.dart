
abstract class AuthLocalDataSource {
  /// Saves the JWT tokens securely to the device
  Future<void> saveTokens({required String accessToken, required String refreshToken});
  
  /// Retrieves the access token for injecting into API headers
  Future<String?> getAccessToken();
  
  /// Completely wipes the tokens during logout
  Future<void> clearTokens();
}