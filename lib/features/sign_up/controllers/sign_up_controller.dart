import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  var signInKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var countryController = TextEditingController();
  var passwordController = TextEditingController();

  void onBack() => Get.back();

  void validateForm(context) {
    var isValid = signInKey.currentState!.validate();

    if (isValid) {
      bool check = GlobalController.to.userData.isNotEmpty;
      final data = UserModel(
        id_user: (check) ? GlobalController.to.userData.last.id_user + 1 : 0,
        name: nameController.text,
        photo: 'no-data',
        phone: phoneController.text,
        address: '...',
        email: emailController.text,
        password: passwordController.text,
        country: '...',
      );

      GlobalController.to.userData.add(data);
      GlobalController.to.user(data);
      HiveService.saveUser(data);
      HiveService.saveListUser(GlobalController.to.userData);
      print(GlobalController.to.userData.length);

      Get.back(result: data);
    }
  }
}
