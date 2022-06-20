import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Widgets/buildCategoreis.dart';
import 'package:gym_app/Widgets/buildTrainings.dart';
import 'package:gym_app/Widgets/buildWorksOut.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymController>(
      init: GymController(),
      builder: (getx) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 20.h, horizontal: 30.w),
                  child: Text(
                    'Popular Workout',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
             buildWorksout(),
              ListTile(
                title: Text(
                  'Category',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                trailing: GestureDetector(
                  onTap: (){
                    getx.increaseCount();
                  },
                  child: Text(
                    'See All +',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontSize: 18.sp),
                  ),
                ),
              ),
             buildCategories(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                child: Text(
                  'Additional Training',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
           buildTrainings()

            ],
          ),
        ),

    );
  }
}
