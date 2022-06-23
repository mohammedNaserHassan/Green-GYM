import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Slider.dart';
class TrainingRow extends StatelessWidget {
  int index;
   TrainingRow(this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            width: 130.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.w),
                  topLeft: Radius.circular(20.w),
                ),
                image: DecorationImage(
                    image: AssetImage(workouts[index].image),fit: BoxFit.fill)),
          ),
          SizedBox(width: 10.w,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workouts[index].title,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20.sp),),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Icon(Icons.local_fire_department_outlined,color: Colors.pink,),
                    SizedBox(width: 5.w,),
                    Text(workouts[index].kcl,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15.sp),),
                    SizedBox(width: 10.w,),
                    Icon(Icons.access_time,color: Colors.blueAccent,),
                    SizedBox(width: 5.w,),
                    Text(workouts[index].time,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 15.sp),),
                  ],
                )
              ],
            ),
          )
        ]
    );
  }
}
