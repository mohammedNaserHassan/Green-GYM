import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes{
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xffFDF2F8),
    buttonColor: Colors.white,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30.sp),
          bodyText2: TextStyle(color: Colors.grey,fontSize: 18.sp,),
        subtitle1: TextStyle(color: Colors.black,fontSize: 15.sp),

      )
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF232441),
    buttonColor: Colors.black,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30.sp),
      bodyText2: TextStyle(color: Colors.grey,fontSize: 18.sp),
        subtitle1: TextStyle(color: Colors.white,fontSize: 15.sp)
    )
  );
}