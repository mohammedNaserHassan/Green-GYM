import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Screens/WorkoutsDetails.dart';

import '../Models/Slider.dart';
import '../Widgets/buildButton.dart';
class Worksout extends StatelessWidget {
  const Worksout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 600.h,
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Get.to(WorkoutsDetails(workouts[index]));
          },
          child: Stack(
            children: [
              Container(
                width: 360.w,
                height: 200.h,
                margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(workouts[index].image),fit: BoxFit.fill)),
              ),
              Positioned(
                top: 15.h,
                bottom: 150.h,
                left: 20.w,
                right: 220.w,
                child: buildButton('Export',(){},Colors.deepPurpleAccent),
              ),
              Positioned(
                top: 15.h,
                bottom: 150.h,
                left: 220.w,
                right: 20.w,
                child: buildButton('Full body',(){},Colors.orange),
              ),
              Positioned(
                bottom: 55.h,
                right: 20.w,
                child: Container(
                  width: 60.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.6)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow,),
                      Text(workouts[index].rate,style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 25.h,
                left: 20.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(workouts[index].title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25.sp,color: Colors.white),),
                    SizedBox(height:10.h,),
                    Row(
                      children: [
                        Icon(Icons.local_fire_department_outlined,color: Colors.white,),
                        SizedBox(width: 5.w,),
                        Text(workouts[index].kcl,style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 15.sp)),
                        SizedBox(width: 25.w,),
                        Icon(Icons.access_time,color: Colors.white,),
                        SizedBox(width: 5.w,),
                        Text(workouts[index].time,style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 15.sp))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
