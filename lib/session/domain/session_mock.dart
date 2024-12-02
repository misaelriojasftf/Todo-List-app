/// [SessionMock] is a utility class used to validate predefined user creds
/// and return an authentication token.
///
/// This class simulates a backend authentication system by using hardcoded
/// credentials and token generation for testing purposes.
class SessionMock {
  /// Predefined username for authentication.
  final String _predefinedUsername = 'test_user';

  /// Predefined password for authentication.
  final String _predefinedPassword = 'Test!123';

  /// Predefined token to simulate successful authentication.
  final String _authToken = 'abc123xyz';

  /// Validates the provided credentials and returns a token if successful.
  ///
  /// [username] - The username input by the user.
  /// [password] - The password input by the user.
  ///
  /// Returns the token if the credentials are valid.
  /// Throws an exception with the message "Invalid credentials" otherwise.
  Future<String> validateCredentials(String username, String password) async {
    // mock a delay to simulate network request
    await Future<void>.delayed(const Duration(seconds: 2));
    if (username == _predefinedUsername && password == _predefinedPassword) {
      return _authToken;
    }
    throw Exception('Invalid credentials');
  }
}
