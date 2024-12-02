import 'package:demo/todo_list/domain/task.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:demo/todo_list/presentation/widgets/delete_task_dialog.dart';
import 'package:demo/todo_list/presentation/widgets/edit_task_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [TaskItem] task item widget draws element task
class TaskItem extends StatelessWidget {
  /// constructor
  const TaskItem({required this.task, super.key});

  /// [Task] input task
  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskState = Provider.of<TaskState>(context, listen: false);

    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (bool? value) {
          taskState.toggleTaskStatus(task.id);
        },
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => EditDialog(task: task),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => DeleteDialog(task: task),
            ),
          ),
        ],
      ),
    );
  }
}
