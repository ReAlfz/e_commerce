import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var signUpKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  RxBool isObscure = true.obs;

  void onBack() => Get.back();

  void showObscure() => isObscure.value = !isObscure.value;

  void validateForm(context) {
    var isValid = signUpKey.currentState!.validate();

    if (isValid) {
      final index = GlobalController.to.userData.indexWhere(
        (element) =>
            element.phone == phoneController.text &&
            element.password == passwordController.text,
      );

      if (index != -1) {
        final data = GlobalController.to.userData[index];
        HiveService.saveUser(data);
        Get.back(result: data);
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Phone number or password wrong',
            message: 'try again with another phone number or password',
            icon: Icon(Icons.warning_amber_outlined, size: 20, color: MainColor.white),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
