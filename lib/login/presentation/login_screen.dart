import 'package:demo/login/presentation/widgets/login_failed_dialog.dart';
import 'package:demo/session/infraestructure/state/session_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// A login screen that allows users to log in with their credentials.
///
/// The login screen consists of a username and password text field, a login
/// button, and some basic styling. It is designed to be responsive and
/// visually appealing for both mobile and web platforms.
class LoginScreen extends StatelessWidget {
  /// Constructor for [LoginScreen]. This takes an optional [key] parameter.
  ///
  /// The [key] parameter is used to identify the widget in the widget tree.
  /// It's useful for working with widget trees or for creating global keys.
  LoginScreen({super.key});

  // Controllers to manage the input fields for username and password
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color of the login screen
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            // Padding for the content to avoid UI elements being
            // too close to edges
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                // Align the content in the center of the screen
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Welcome Text
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28, // Large font size for emphasis
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // Dark color for readability
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                  const SizedBox(height: 20), // Add spacing below the text

                  // Username input field
                  _buildTextField(
                    controller: _usernameController,
                    hintText: 'Username',
                  ),
                  const SizedBox(height: 16), // Add spacing between fields

                  // Password input field
                  _buildTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 20), // Add spacing before the button

                  // Login button
                  Consumer<SessionState>(
                    builder: (context, sessionState, _) {
                      return ElevatedButton(
                        onPressed: () async {
                          final username = _usernameController.text;
                          final password = _passwordController.text;

                          if (sessionState.validate(username, password)) {
                            return sessionState.login(username, password);
                          }
                          return;
                          // Trigger the login action here (e.g., validate
                          // credentials)
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Consumer<SessionState>(
            builder: (context, sessionState, _) {
              if (sessionState.isLoggingIn) {
                return const Center(child: CircularProgressIndicator());
              }
              if (sessionState.authToken != null) {
                // Navigate if login is successful
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.go('/todo');
                });
              }
              if (sessionState.errorMessage != null) {
                // Show error if login failed
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog<void>(
                    context: context,
                    builder: (_) => LoginFailedDialog(
                      errorMessage: sessionState.errorMessage,
                    ),
                  );
                });
              }
              return const SizedBox
                  .shrink(); // Empty widget when no status to display
            },
          ),
        ],
      ),
    );
  }

  /// A helper method that builds a customizable text field widget.
  ///
  /// This method abstracts the creation of the username/password text field,
  /// making it easier to reuse and maintain. It also customizes the appearance
  /// of the text fields with rounded corners and padding.
  ///
  /// - `controller`: The controller for the text field (either username or pwd)
  /// - `hintText`: The text that appears inside the text field as a hint.
  /// - `isPassword`: A flag to determine if the field is for password input
  ///
  /// Returns a [TextField] widget that can be reused throughout the app.
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword, // If password, obscure the text
      decoration: InputDecoration(
        hintText: hintText, // Show hint text in the input field
        filled: true,
        fillColor: Colors.grey[200], // Background color for the input field
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(8), // Rounded corners for the input field
          borderSide:
              BorderSide.none, // Remove border side to create a smooth look
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
        ), // Horizontal padding inside the field
      ),
    );
  }
}
