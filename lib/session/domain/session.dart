import 'package:demo/common/domain/utils/utils.dart';

/// A class representing a user session with a single token.
class Session {
  /// Session Constructor
  Session({
    required this.token,
  });

  /// Creates a Session from a JSON object.
  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      token: string(json['token']),
    );
  }

  /// The authentication token for the session.
  String token;

  /// Converts a Session to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
