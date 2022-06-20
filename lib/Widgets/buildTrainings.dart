import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Slider.dart';
class buildTrainings extends StatelessWidget {
  const buildTrainings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: workouts.length,
        itemBuilder: (context,index)=>Container(
          height: 100.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).buttonColor,
          ),
          child: Row(
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
          ),
        )
    );
  }
}
