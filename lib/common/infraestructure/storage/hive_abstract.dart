/// [HiveAbstract] hive core class with main methods
abstract class HiveAbstract<T> {
  /// constructor
  HiveAbstract();

  /// box gets initilized
  Future<void> initilizeBox();

  /// add new element
  Future<void> add(T item);

  /// adds all ements
  Future<void> addAll(List<T> items);

  // Add more methods for other operations like delete, update, etc.
}
