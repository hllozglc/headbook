import 'package:get/get.dart';

class AppDataController extends GetxController {
  var categorySelectedItem = "".obs;
  void upDateSelectedItemCategory(value) {
    categorySelectedItem.value = value;
  }
}
