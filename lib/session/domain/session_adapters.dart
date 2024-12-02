import 'package:demo/session/domain/session.dart';
import 'package:hive/hive.dart';

/// [SessionAdapter] hive adapter for [Session] entity
class SessionAdapter extends TypeAdapter<Session> {
  @override
  final typeId = 1; // Unique identifier for this adapter

  @override
  Session read(BinaryReader reader) {
    return Session(
      token: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Session obj) {
    writer.writeString(obj.token);
  }
}
