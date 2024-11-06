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
import 'package:e_commerce/shared/widgets/custom_pin_widget.dart';
import 'package:e_commerce/utils/services/hive_service.dart';
import 'package:flutter/material.dart';
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
            GlobalController.to.user(data);
          }
        } catch (e, stackTrace) {
          log('Error in login with error: $e', name: 'Login');
          log('Stack login trace: $stackTrace', name: 'Login');
        }

        break;

      case MainRoute.signUp:
        try {
          final data = await Get.toNamed(MainRoute.signUp);
          if (data != null) {
            user(data as UserModel);
            GlobalController.to.user(data);
          }
        } catch (e, stackTrace) {
          log('Error in get result sign up with error: $e', name: 'Sign Up');
          log('Stack get result sign up trace: $stackTrace', name: 'Sign Up');
        }

      default:
        try {
          HiveService.user.clear();
          user(user.value = null);
          photoState('no-data');
          GlobalController.to.user(GlobalController.to.user.value = null);
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

      case 'Password':
        final data = await Get.bottomSheet(
          ProfileBottomSheet(
            title: code,
            minTextLength: 3,
            hint: user.value!.password,
            type: TextInputType.text,
          ),
          isDismissible: true,
        );
        if (data != null) {
          user.value!.password = data as String;
          updateHive();
          user.refresh();
        }
        break;

      case 'Pin':
        final data = await Get.bottomSheet(
          Container(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            decoration: const BoxDecoration(
              color: MainColor.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: CustomPinWidget(
              title: 'Change Pin',
              isObscure: obscure.value,
              pinController: pinController,
              onSubmit: (value) => Get.back(result: value),
            ),
          ),
        );
        if (data != null) {
          user.value!.pin = data as String;
          pinController.clear();
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
