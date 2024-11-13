import 'package:e_commerce/features/sign_up/controllers/sign_controller.dart';
import 'package:get/get.dart';

class SignBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignController());
  }
}