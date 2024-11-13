import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignController extends GetxController {
  static SignController get to => Get.find();
  void onBack() => Get.back();
  RxBool currentState = true.obs;
  void changeState() => currentState.value = !currentState.value;

  /// Login controller ///

  var loginKey = GlobalKey<FormState>();
  var loginPhoneController = TextEditingController();
  var loginPasswordController = TextEditingController();
  RxBool isObscureLogin = true.obs;

  void showObscureLogin() => isObscureLogin.value = !isObscureLogin.value;

  void validateLogin(context) {
    var isValid = loginKey.currentState!.validate();

    if (isValid) {
      final index = GlobalController.to.userData.indexWhere(
        (element) =>
            element.phone == loginPhoneController.text &&
            element.password == loginPasswordController.text,
      );

      if (index != -1) {
        final data = GlobalController.to.userData[index];
        final mapData = {'key': 'log_in', 'value': data};
        HiveService.saveUser(data);
        Get.back(result: mapData);
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

  /// sign up controller ///

  var signUpKey = GlobalKey<FormState>();

  var signNameController = TextEditingController();
  var signEmailController = TextEditingController();
  var signPhoneController = TextEditingController();
  var signAddressController = TextEditingController();
  var signCountryController = TextEditingController();
  var signPasswordController = TextEditingController();

  RxBool isObscureSignUp = true.obs;
  void showObscureSignUp() => isObscureSignUp.value = !isObscureSignUp.value;
  void validateSignUp(context) {
    var isValid = signUpKey.currentState!.validate();

    if (isValid) {
      bool check = GlobalController.to.userData.isNotEmpty;
      final data = UserModel(
        id_user: (check) ? GlobalController.to.userData.last.id_user + 1 : 0,
        name: signNameController.text,
        photo: 'no-data',
        phone: signPhoneController.text,
        address: '...',
        email: signEmailController.text,
        password: signPasswordController.text,
        country: '...',
        pin: '...',
      );

      GlobalController.to.userData.add(data);
      GlobalController.to.user(data);
      HiveService.saveUser(data);
      HiveService.saveListUser(GlobalController.to.userData);

      final mapData = {'key': 'sign_up', 'value': data};

      Get.back(result: mapData);
    }
  }
}
