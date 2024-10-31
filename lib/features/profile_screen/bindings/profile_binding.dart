import 'package:e_commerce/features/profile_screen/controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(ProfileController());
  }
}