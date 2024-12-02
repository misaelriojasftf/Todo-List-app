import 'package:demo/common/infraestructure/storage/hive_abstract.dart';

/// initilize boxes
Future<void> initilizeBoxes(
  /// boxes
  // ignore: strict_raw_type
  List<HiveAbstract> boxes,
) async {
  for (final box in boxes) {
    await box.initilizeBox();
  }
}
