import 'dart:developer';
import 'dart:io';

import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:e_commerce/features/navigation/controllers/navigation_controller.dart';
import 'package:e_commerce/features/profile_screen/views/components/image_picker_dialog.dart';
import 'package:e_commerce/features/profile_screen/views/components/profile_bottom_sheet.dart';
import 'package:e_commerce/features/sign_up/models/dropdown_model.dart';
import 'package:e_commerce/shared/global_controllers/global_controller.dart';
import 'package:e_commerce/shared/global_models/user_model.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final Rx<File?> imageFile = Rx<File?>(null);
  RxString photoState = 'no-data'.obs;
  Rxn<UserModel> user = Rxn<UserModel>();

  final List<DropdownModel> dropdownList = [
    DropdownModel(title: 'Log In', route: MainRoute.login),
    DropdownModel(title: 'Sign Up', route: MainRoute.signUp),
    DropdownModel(title: 'Sign Out', route: ''),
  ];

  void toPush(String? value) async {
    switch (value) {
      case MainRoute.login:
        try {
          final data = await Get.toNamed(MainRoute.login);
          if (data != null) {
            user(data as UserModel);
            photoState('data-hive');
          }
        } catch (e, stackTrace) {
          log('Error in login with error: $e', name: 'Login');
          log('Stack login trace: $stackTrace', name: 'Login');
        }

        break;

      case MainRoute.signUp:
        try {
          final data = await Get.toNamed(MainRoute.signUp);
          if (data != null) user(data as UserModel);
        } catch (e, stackTrace) {
          log('Error in get result sign up with error: $e', name: 'Sign Up');
          log('Stack get result sign up trace: $stackTrace', name: 'Sign Up');
        }

      default:
        try {
          HiveService.user.clear();
          user(user.value = null);
          photoState('no-data');
          NavigationController.to.changePages(0);
        } catch (e, stackTrace) {
          log('Error in sign out with error: $e', name: 'Sign Out');
          log('Stack sign out trace: $stackTrace', name: 'Sign Out');
        }
    }
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

  void changeData({required String code}) async {
    final data = await Get.bottomSheet(
      const ProfileBottomSheet(),
      isDismissible: true,
    );
    switch (code) {
      case 'Name':
      case 'Email':
      case 'Number':
      case 'Address':
      case 'Country':
      case 'Password':
      default:
    }
  }

  @override
  void onInit() {
    user(GlobalController.to.user.value);
    if (GlobalController.to.user.value != null) photoState('data-hive');
    super.onInit();
  }

  void updateHive() {
    GlobalController.to.userData[GlobalController.to.userData.indexWhere(
          (element) => element.id_user == user.value!.id_user,
    )] = user.value!;
    HiveService.saveUser(user.value!);
    HiveService.saveListUser(GlobalController.to.userData);
  }
}
