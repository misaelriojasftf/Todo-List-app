/// converts to string
String string(dynamic element) => '$element';

/// converts to num
num number(dynamic element, [num fb = 0]) => num.tryParse('$element') ?? fb;

/// converts to boolean
bool boolean(dynamic element) => element == true;

/// Validates if the given [username] is valid.
///
/// The username must:
/// - Be non-empty
/// - Contain only alphanumeric characters and underscores
/// - Be between 3 and 20 characters long
///
/// Returns `true` if the username is valid, otherwise returns `false`.
bool isValidUsername(String username) {
  final regex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
  return regex.hasMatch(username);
}

/// Validates if the given [password] is valid.
///
/// The password must:
/// - Be at least 8 characters long
/// - Contain at least one uppercase letter
/// - Contain at least one number
/// - Contain at least one special character
///
/// Returns `true` if the password is valid, otherwise returns `false`.
bool isValidPassword(String password) {
  final regex =
      RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
  return regex.hasMatch(password);
}
