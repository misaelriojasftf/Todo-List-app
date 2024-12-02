import 'package:demo/common/infraestructure/storage/hive_abstract.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// [HiveRepo] receives generic type and has usages of [HiveAbstract]
/// core methods
class HiveRepo<T> extends HiveAbstract<T> {
  /// constructor
  HiveRepo(this.boxName) : super();

  /// hive box
  Box<T>? box;

  /// key value of box
  String boxName;

  @override
  Future<void> initilizeBox() async {
    box = await Hive.openBox<T>(boxName);
  }

  @override
  Future<void> add(T item) async {
    await box?.add(item);
  }

  @override
  Future<void> addAll(List<T> items) async {
    await box?.addAll(items);
  }

  // Override more methods for other operations like delete, update, etc.
}
