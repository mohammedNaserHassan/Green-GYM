import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gym_app/Widgets/trainingRow.dart';

import '../Models/Slider.dart';
import '../Screens/TrainingPage.dart';
class buildTrainings extends StatelessWidget {
  const buildTrainings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: workouts.length,
        itemBuilder: (context,index)=>GestureDetector(
          onTap: (){
            Get.to(TrainingPage(index));
          },
          child: Container(
            height: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).buttonColor,
            ),
            child: TrainingRow(index)
          ),
        )
    );
  }
}
