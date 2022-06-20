import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Category.dart';
class SingleCategory extends StatelessWidget {
  int index;
   SingleCategory(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:160.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).buttonColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(categories[index].iconData,color: Colors.white,),
            backgroundColor: categories[index].color,
          ),
          SizedBox(height: 10.h,),
          Text(categories[index].title??'',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 18.sp),maxLines: 1,),
        ],
      ),
    );
  }
}
