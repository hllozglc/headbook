import 'package:get/get.dart';
import 'package:headbook/controllers/appDataController.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AppDataController>(AppDataController());
  }
}
