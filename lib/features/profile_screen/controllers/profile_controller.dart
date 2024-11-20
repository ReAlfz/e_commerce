import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/favorite_screen/controllers/favorite_controller.dart';
import 'package:e_commerce/features/navigation/controllers/navigation_controller.dart';
import 'package:e_commerce/features/profile_screen/views/components/image_picker_dialog.dart';
import 'package:e_commerce/features/profile_screen/views/components/profile_bottom_sheet.dart';
import 'package:e_commerce/features/profile_screen/views/components/verify_password_widget.dart';
import 'package:e_commerce/features/profile_screen/views/components/verify_pin_widget.dart';
import 'package:e_commerce/features/transaction_screen/controller/transaction_controller.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final Rx<File?> imageFile = Rx<File?>(null);
  RxString photoState = ''.obs;
  Rxn<UserModel> user = Rxn<UserModel>();

  void pushToLogin() async {
    final data = await Get.toNamed(MainRoute.sign);
    if (data != null) {
      UserModel userData = data['value'] as UserModel;
      String userKey = data['key'] as String;
      user(userData);
      GlobalController.to.user(userData);

      if (userKey == 'sign_up') {
        Timer(
          const Duration(milliseconds: 400),
          () => changeData(code: 'Pin'),
        );
      }
    }
  }

  void signOut() {
    HiveService.user.clear();
    user(user.value = null);
    GlobalController.to.user(GlobalController.to.user.value = null);

    TransactionController.to.transactionList.clear();
    GlobalController.to.transactionList.clear();
    HiveService.listTransaction.clear();

    FavoriteController.to.favoriteList.clear();

    NavigationController.to.changePages(0);
    // HiveService.listUser.clear();
  }

  Future<void> pickImage() async {
    try {
      ImageSource? imageSource = await Get.defaultDialog(
        title: '',
        titleStyle: const TextStyle(fontSize: 0),
        content: const ImagePickerDialog(),
      );

      if (imageSource == null) return;

      final pickFile = await ImagePicker().pickImage(
        source: imageSource,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 75,
      );

      if (pickFile != null) {
        imageFile.value = File(pickFile.path);
        final cropFile = await ImageCropper().cropImage(
          sourcePath: imageFile.value!.path,
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Cropper'.tr,
              toolbarColor: MainColor.secondaryDark,
              toolbarWidgetColor: MainColor.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
            ),
            IOSUiSettings(
              aspectRatioPickerButtonHidden: true,
              aspectRatioLockEnabled: true,
            ),
          ],
        );

        if (cropFile != null) {
          imageFile(File(cropFile.path));
          photoState('data-file');

          final directory = await getApplicationDocumentsDirectory();
          final String path = directory.path;
          const String fileName = 'profile_photo.jpg';
          final File saveFile = File('$path/$fileName');
          await saveFile.writeAsBytes(await cropFile.readAsBytes());

          user.value!.photo = saveFile.path;
          updateHive();
        }
      }
    } catch (e, stackTrace) {
      log('Error in PickImage() with error: $e', name: 'Pick Image');
      log('Stack PickImage() trace: $stackTrace', name: 'Pick Image');
    }
  }

  final TextEditingController pinController = TextEditingController();
  final RxBool obscure = RxBool(true);

  void changeData({required String code}) async {
    switch (code) {
      case 'Name':
        final data = await Get.bottomSheet(
          ProfileBottomSheet(
            title: code,
            minTextLength: 3,
            hint: user.value!.name,
            type: TextInputType.text,
          ),
          isDismissible: true,
        );
        if (data != null) {
          user.value!.name = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Email':
        final data = await Get.bottomSheet(
          ProfileBottomSheet(
            title: code,
            minTextLength: 3,
            hint: user.value!.email,
            type: TextInputType.emailAddress,
          ),
          isDismissible: true,
        );
        if (data != null) {
          user.value!.email = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Phone Number':
        final data = await Get.bottomSheet(
          ProfileBottomSheet(
            title: code,
            minTextLength: 6,
            hint: user.value!.phone,
            type: TextInputType.phone,
          ),
          isDismissible: true,
        );
        if (data != null) {
          user.value!.phone = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Address':
        final data = await Get.bottomSheet(
          ProfileBottomSheet(
            title: code,
            minTextLength: 3,
            hint: (user.value!.address != '...') ? user.value!.address : '',
            type: TextInputType.text,
          ),
          isDismissible: true,
        );
        if (data != null) {
          user.value!.address = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Country':
        final data = await Get.bottomSheet(
          ProfileBottomSheet(
            title: code,
            minTextLength: 3,
            hint: (user.value!.country != '...') ? user.value!.country : '',
            type: TextInputType.text,
          ),
          isDismissible: true,
        );
        if (data != null) {
          user.value!.country = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Pin':
        final data = await Get.defaultDialog(
          title: '',
          barrierDismissible: true,
          backgroundColor: MainColor.white,
          contentPadding: EdgeInsets.zero,
          titleStyle: const TextStyle(fontSize: 0),
          content: VerifyPinWidget(pinValue: user.value!.pin),
        );
        if (data != null) {
          user.value!.pin = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Password':
        final data = await Get.defaultDialog(
          title: '',
          barrierDismissible: true,
          backgroundColor: MainColor.white,
          contentPadding: EdgeInsets.zero,
          titleStyle: const TextStyle(fontSize: 0),
          content: VerifyPasswordWidget(password: user.value!.password),
        );

        if (data != null) {
          user.value!.password = data as String;
          updateHive();
          user.refresh();
        }
        break;

      default:
        break;
    }
  }

  @override
  void onInit() {
    user(GlobalController.to.user.value);
    if (GlobalController.to.user.value != null) {
      (GlobalController.to.user.value!.photo != 'no-data')
          ? photoState('data-hive')
          : photoState('no-data');
    }
    super.onInit();
  }

  void updateHive() {
    GlobalController.to.userData[GlobalController.to.userData.indexWhere(
      (element) => element.id_user == user.value!.id_user,
    )] = user.value!;
    HiveService.saveUser(user.value!);
    HiveService.saveListUser(GlobalController.to.userData);
    GlobalController.to.user(user.value);
    GlobalController.to.user.refresh();
  }
}
