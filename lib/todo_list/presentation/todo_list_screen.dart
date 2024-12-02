import 'package:demo/session/infraestructure/state/session_state.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:demo/todo_list/presentation/widgets/add_task_dialog.dart';
import 'package:demo/todo_list/presentation/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// [TodoListScreen] widget that draws the list of elements
class TodoListScreen extends StatelessWidget {
  /// constructor
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Log the user out
              context.go('/login');
              await context.read<SessionState>().logout();

              // Navigate to the login screen after logout
            },
          ),
        ],
      ),
      body: Consumer<TaskState>(
        builder: (context, taskState, _) {
          final tasks = taskState.tasks;
          if (tasks.isEmpty) {
            return const Center(child: Text('Nothing to show...'));
          }

          final incompleteTasks =
              tasks.where((task) => !task.isCompleted).toList();
          final completedTasks =
              tasks.where((task) => task.isCompleted).toList();

          return ListView.builder(
            itemCount: incompleteTasks.length + completedTasks.length,
            itemBuilder: (context, index) {
              if (index < incompleteTasks.length) {
                return Dismissible(
                  key: Key(incompleteTasks[index].id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    // Delete the task
                    taskState.deleteTask(incompleteTasks[index].id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task deleted'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: TaskItem(task: incompleteTasks[index]),
                );
              }
              final completedIndex = index - incompleteTasks.length;
              final task = completedTasks[completedIndex];
              return Dismissible(
                key: Key(task.id),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  // Delete the task
                  taskState.deleteTask(task.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task deleted'),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: TaskItem(task: task),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (context) => const AddDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
