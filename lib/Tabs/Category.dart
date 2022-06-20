import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:gym_app/Widgets/singleCategory.dart';

import '../Models/Category.dart';
class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymController>(
      init: GymController(),
      builder:(getx)=> GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        itemCount: categories.length,
        itemBuilder: (context,index)=>SingleCategory(index), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5.h,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
      ),
    );
  }
}
