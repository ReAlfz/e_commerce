import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/modules/features/sign_up/models/dropdown_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final List<DropdownModel> dropdownList = [
    DropdownModel(title: 'Sign Up', route: MainRoute.signUp),
    DropdownModel(title: 'Sign Out', route: ''),
  ];

}