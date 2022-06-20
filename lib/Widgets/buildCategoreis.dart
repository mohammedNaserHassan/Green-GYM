import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:gym_app/Widgets/singleCategory.dart';

import '../Models/Category.dart';
class buildCategories extends StatelessWidget {
  const buildCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<GymController>(
      init: GymController(),
      builder: (getx) {
        return Container(
          height: 170.h,
          margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: getx.count,
              itemBuilder: (context, index) => SingleCategory(index),
          ),);
      }
    );
  }
}
