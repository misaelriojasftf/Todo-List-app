import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A [StatelessWidget] that displays an alert dialog when a login attempt fails
///
/// This widget shows an [AlertDialog] with a title "Login Failed" and the error
/// message passed to it. It provides a button labeled 'OK' to close the dialog.
///
/// The [errorMessage] is displayed as the content of the dialog to notify the
/// user about the reason for the failed login attempt.
class LoginFailedDialog extends StatelessWidget {
  /// Constructor for the [LoginFailedDialog] widget.
  ///
  /// Takes a required [errorMessage]
  /// string that will be displayed in the dialog.
  const LoginFailedDialog({
    required this.errorMessage,
    super.key,
  });

  /// The error message that will be displayed in the dialog.
  ///
  /// This message is passed as a parameter and provides feedback to the user
  /// about the login failure.
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Login Failed'), // The title of the alert dialog
      content: Text(
        errorMessage ?? 'Unknown Error',
      ), // Displays the error message passed to the widget
      actions: [
        TextButton(
          onPressed:
              context.pop, // Closes the dialog when the button is pressed
          child: const Text('OK'), // The button label to dismiss the dialog
        ),
      ],
    );
  }
}
