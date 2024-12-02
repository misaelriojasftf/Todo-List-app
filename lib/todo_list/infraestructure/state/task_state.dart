import 'package:demo/todo_list/domain/task.dart';
import 'package:demo/todo_list/infraestructure/storage/task_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// A class that manages the state of tasks, including adding, toggling,
/// and deleting tasks.
class TaskState with ChangeNotifier {
  /// constructor
  TaskState({required TaskStorage storage}) {
    _taskStorage = storage;
    _loadTasks();
  }
  final List<Task> _tasks = [];
  final _uuid = const Uuid();
  late TaskStorage _taskStorage;

  /// gets list of tasks
  List<Task> get tasks => _tasks;

  Future<void> _loadTasks() async {
    _tasks
      ..clear()
      ..addAll(_taskStorage.box?.values.toList() ?? []);
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    await _taskStorage.box?.clear();
    await _taskStorage.box?.addAll(_tasks);
  }

  /// Adds a new task with the given title to the list of tasks.
  void addTask(String title) {
    final newTask = Task(id: _uuid.v4(), title: title);
    _tasks.add(newTask);
    _saveTasks();
    notifyListeners();
  }

  /// Toggles the completion status of the task with the given id.
  void toggleTaskStatus(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
    _saveTasks();
    notifyListeners();
  }

  /// Deletes the task with the given id from the list of tasks.
  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  /// Edits the tasks with the given id from the list of tasks
  void editTask(String id, String newTitle) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index].title = newTitle;
      _saveTasks();
      notifyListeners();
    }
  }
}
