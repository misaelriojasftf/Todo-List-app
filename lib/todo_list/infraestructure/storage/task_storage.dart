import 'package:demo/common/infraestructure/storage/hive_repo.dart';
import 'package:demo/todo_list/domain/task.dart';
import 'package:demo/todo_list/domain/task_adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// [TaskStorage] collects all tasks
class TaskStorage extends HiveRepo<Task> {
  /// contructor
  TaskStorage() : super('Task') {
    Hive.registerAdapter(TaskAdapter());
  }

  // Add internal methods
}
