import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [AddDialog] dialog widget that draws add new item
class AddDialog extends StatelessWidget {
  /// constructor
  const AddDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var taskTitle = '';
    return AlertDialog(
      title: const Text('Add Task'),
      content: TextField(
        onChanged: (value) {
          taskTitle = value;
        },
        decoration: const InputDecoration(
          hintText: 'Enter task title',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskState>(context, listen: false).addTask(taskTitle);
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
