import 'package:e_commerce/configs/pages/main_page.dart';
import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:e_commerce/modules/global_bindings/global_binding.dart';
import 'package:e_commerce/modules/global_models/product_model.dart';
import 'package:e_commerce/modules/global_models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Decker',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 350),
          getPages: MainPage.main,
          initialRoute: MainRoute.splash,
          initialBinding: GlobalBinding(),
        );
      },
    );
  }
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox('user-database');
  await Hive.openBox('list');
}
