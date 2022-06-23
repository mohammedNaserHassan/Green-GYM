import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Category.dart';
class CategoryDetails extends StatelessWidget {
  Color color;
  String txt;
  int index;
  CategoryDetails({required this.color,required this.txt,required this.index});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: 160.w,
      height: 210.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Theme.of(context).canvasColor
      ),
      child: Column(
        children: [
          SizedBox(height: 30.h,),
          CircleAvatar(
            radius: 25,
            backgroundColor:color,
            child: Icon(Icons.ac_unit_outlined,color: Colors.white,),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('9$index',style: TextStyle(color: color,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(width: 5.w,),
              Text('bpm',style: TextStyle(color: Colors.grey,fontSize: 14),),
            ],
          ),
          SizedBox(height: 10.h,),
          Center(child: Text(categories[index].title.toString()+'\t'+txt,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),)),
        ],
      ),
    );
  }
}
