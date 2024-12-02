import 'package:demo/todo_list/domain/task.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [DeleteDialog] dialog widget that draws deletes an item
class DeleteDialog extends StatelessWidget {
  /// constructor
  const DeleteDialog({required this.task, super.key});

  /// Task input parameter
  final Task task;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Task'),
      content:
          Text('Are you sure you want to remove the task?\n\n${task.title}'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskState>(context, listen: false).deleteTask(
              task.id,
            );
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
