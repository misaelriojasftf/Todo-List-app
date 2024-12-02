// lib/main.dart
import 'package:demo/common/infraestructure/storage/main.dart';
import 'package:demo/login/presentation/login_screen.dart';
import 'package:demo/session/infraestructure/state/session_state.dart';
import 'package:demo/session/infraestructure/storage/session_storage.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:demo/todo_list/infraestructure/storage/task_storage.dart';
import 'package:demo/todo_list/presentation/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final task = TaskStorage();
  final session = SessionStorage();
  await initilizeBoxes([task, session]);
  runApp(MyApp(task, session));
}

/// [MyApp] core widget
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp(this._taskStorage, this._sessionStorage, {super.key});
  final TaskStorage _taskStorage;
  final SessionStorage _sessionStorage;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskState(storage: _taskStorage),
        ),
        ChangeNotifierProvider(
          create: (context) => SessionState(storage: _sessionStorage),
        ), // Add SessionStat
      ],
      child: MaterialApp.router(
        title: 'To-Do List App',
        theme: ThemeData(),
        routerConfig: _router,
      ),
    );
  }

  // Define the GoRouter with two screens
  GoRouter get _router {
    return GoRouter(
      initialLocation: (_sessionStorage.box?.isEmpty ?? true)
          ? '/login'
          : '/todo', // Start at the appropriate screen based on the session token
      routes: [
        // Login Screen Route
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        // To-Do List Screen Route
        GoRoute(
          path: '/todo',
          builder: (context, state) => const TodoListScreen(),
        ),
      ],
    );
  }
}
