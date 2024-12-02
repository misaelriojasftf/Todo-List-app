import 'package:demo/todo_list/domain/task.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:demo/todo_list/infraestructure/storage/task_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTaskStorage extends Mock implements TaskStorage {}

void main() {
  group('TaskState', () {
    late TaskState taskState;
    late MockTaskStorage mockTaskStorage;

    setUp(() async {
      mockTaskStorage = MockTaskStorage();
      taskState = TaskState(storage: mockTaskStorage);
    });

    test('Add task', () {
      // Arrange
      final initialTaskCount = taskState.tasks.length;

      // Act
      taskState.addTask('Test task');

      // Assert
      expect(taskState.tasks.length, equals(initialTaskCount + 1));
      expect(taskState.tasks.last.title, equals('Test task'));
    });

    test('Toggle task status', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task');
      taskState.tasks.add(task);

      // Act
      taskState.toggleTaskStatus(task.id);

      // Assert
      expect(taskState.tasks.first.isCompleted, equals(true));
    });

    test('Delete task', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task');
      taskState.tasks.add(task);

      // Act
      taskState.deleteTask(task.id);

      // Assert
      expect(taskState.tasks.length, equals(0));
    });
  });
}
