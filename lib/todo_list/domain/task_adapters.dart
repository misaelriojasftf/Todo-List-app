import 'package:demo/todo_list/domain/task.dart';
import 'package:hive/hive.dart';

/// [TaskAdapter] hive adapter for [Task] entity
class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      id: reader.readString(),
      title: reader.readString(),
      isCompleted: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.title)
      ..writeBool(obj.isCompleted);
  }
}
