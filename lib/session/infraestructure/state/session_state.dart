import 'package:demo/common/domain/utils/utils.dart';
import 'package:demo/session/domain/session.dart';
import 'package:demo/session/domain/session_mock.dart';
import 'package:demo/session/infraestructure/storage/session_storage.dart';
import 'package:flutter/material.dart';

/// [SessionState] is responsible for managing the user's authentication state
/// and storing the authentication token.
class SessionState extends ChangeNotifier {
  /// Constructor that takes [SessionStorage] to manage the session.
  SessionState({required SessionStorage storage}) {
    _sessionStorage = storage;
  }
  String? _authToken;
  String? _errorMessage;

  bool _isLoggingIn = false;

  final SessionMock _sessionMock = SessionMock();
  late final SessionStorage _sessionStorage;

  /// Retrieves the stored authentication token.
  String? get authToken => _authToken;

  /// Indicates whether the login process is ongoing.
  bool get isLoggingIn => _isLoggingIn;

  /// Retrieves the error message if the login failed.
  String? get errorMessage => _errorMessage;

  /// Method to validate the user's credentials and store the token if success
  Future<void> login(String username, String password) async {
    _isLoggingIn = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate async login validation
      _authToken = await _sessionMock.validateCredentials(username, password);

      // Save the token in storage
      await _sessionStorage.add(Session(token: _authToken!));

      _isLoggingIn = false;
      notifyListeners();
    } catch (e) {
      _authToken = null;
      _errorMessage = e.toString();
      _isLoggingIn = false;
      notifyListeners();
    }
  }

  /// Logs out the user by clearing the session token.
  Future<void> logout() async {
    _authToken = null;
    _errorMessage = null;

    // Clear the session from storage
    await _sessionStorage.box?.clear();

    notifyListeners();
  }

  /// Validates the username and password fields.
  ///
  /// The username and password are valid if:
  /// - The username matches the pattern of alphanumeric
  ///   characters and underscores,
  ///   with a length between 3 and 20 characters.
  /// - The password is at least 8 characters long, contains at
  ///   least one uppercase letter,
  ///   one number, and one special character.
  ///
  /// Returns `true` if both the username and password are valid,
  /// otherwise returns `false`.
  bool validate(String username, String password) {
    if (isValidUsername(username) && isValidPassword(password)) {
      return true;
    }
    return false;
  }
}
