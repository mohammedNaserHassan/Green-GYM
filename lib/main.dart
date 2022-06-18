import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym_app/Screens/SplashScreen.dart';
import 'package:gym_app/Theme/Theme_Services.dart';
import 'package:gym_app/Theme/Themes.dart';

import 'Screens/Auth/LoginRegister.dart';
void main()async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 834.90),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,child)=> GetMaterialApp(
        themeMode: ThemeServices().getThemeMode(),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
