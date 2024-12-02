import 'package:demo/todo_list/domain/task.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [EditDialog] dialog widget that draws edit an item
class EditDialog extends StatelessWidget {
  /// constructor
  const EditDialog({required this.task, super.key});

  /// Task input parameter
  final Task task;

  @override
  Widget build(BuildContext context) {
    var newTaskTitle = task.title;
    return AlertDialog(
      title: const Text('Edit Task'),
      content: TextField(
        onChanged: (value) {
          newTaskTitle = value;
        },
        decoration: const InputDecoration(
          hintText: 'Enter new task title',
        ),
        controller: TextEditingController(text: task.title),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskState>(context, listen: false).editTask(
              task.id,
              newTaskTitle,
            );
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
