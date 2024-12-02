import 'package:demo/common/infraestructure/storage/hive_repo.dart';
import 'package:demo/session/domain/session.dart';
import 'package:demo/session/domain/session_adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// [SessionStorage] collects all tasks
class SessionStorage extends HiveRepo<Session> {
  /// contructor
  SessionStorage() : super('Session') {
    Hive.registerAdapter(SessionAdapter());
  }

  // Add internal methods
}
