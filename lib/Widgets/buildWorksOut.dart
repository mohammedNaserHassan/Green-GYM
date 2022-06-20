import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Slider.dart';
import 'buildButton.dart';
class buildWorksout extends StatelessWidget {
  const buildWorksout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 230.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workouts.length,
        itemBuilder: (context, index) => Stack(
          children: [
            Container(
              width: 320.w,
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(workouts[index].image),fit: BoxFit.fill)),
            ),
            Positioned(
              top: 23.h,
              bottom: 155.h,
              left: 20.w,
              right: 220.w,
              child: buildButton('Export',(){},Colors.deepPurpleAccent),
            ),
            Positioned(
              top: 23.h,
              bottom: 155.h,
              left: 130.w,
              right: 110.w,
              child: buildButton('Full body',(){},Colors.orange),
            ),
            Positioned(
              top: 35.h,
              right: 15.w,
              child: Container(
                width: 60.w,
                height: 30.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12.withOpacity(0.5)
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
              bottom: 20.h,
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
    );
  }
}
