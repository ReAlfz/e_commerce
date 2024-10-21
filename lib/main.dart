import 'package:e_commerce/configs/pages/main_page.dart';
import 'package:e_commerce/configs/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
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
          defaultTransition: Transition.native,
          getPages: MainPage.main,
          initialRoute: MainRoute.splash,
        );
      },
    );
  }
}
