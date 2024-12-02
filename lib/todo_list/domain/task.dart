import 'package:demo/common/domain/utils/utils.dart';

/// A class representing a task with an id, title, and completion status.
class Task {
  /// Task Constructor
  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  /// Creates a Task from a JSON object.
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: string(json['id']),
      title: string(json['title']),
      isCompleted: boolean(json['isCompleted']),
    );
  }

  /// id of element task
  String id;

  /// id of title
  String title;

  /// flag if it's completed
  bool isCompleted;

  /// Converts a Task to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
