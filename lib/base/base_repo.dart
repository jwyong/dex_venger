import 'package:dex_venger/database/my_database.dart';
import 'package:get/get.dart';

abstract class BaseRepo {
  late final MyDatabase database = Get.find<MyDatabase>();
}