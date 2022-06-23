import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Models/Category.dart';
import 'package:gym_app/Models/Slider.dart';
import 'package:gym_app/Widgets/buildButton.dart';
import 'package:gym_app/Widgets/categoryDetails.dart';
class CategoryScreen extends StatelessWidget {
  int index;
   CategoryScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          categories[index].title.toString(),
          style:
          Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
        ),
        actions: [
          CircleAvatar(
            child: Icon(Icons.bookmark,color: Colors.teal,),
            backgroundColor: Theme.of(context).canvasColor,
          ),
          SizedBox(
            width: 15.w,
          )
        ],
        leading: Container(
          margin: EdgeInsets.only(left: 15.w),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CircleAvatar(
                child: Icon(Icons.arrow_back,color: Colors.teal,),
                backgroundColor: Theme.of(context).canvasColor,
              )),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width:100.w,child: buildButton('Day', (){}, Theme.of(context).canvasColor)),
              Container(width:100.w,child: buildButton('Weak', (){},  Theme.of(context).canvasColor)),
              Container(width:120.w,child: buildButton('Month', (){}, Colors.teal)),
            ],
          ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryDetails(color: Colors.teal, txt: 'Variability', index: index),
            CategoryDetails(color: Colors.orange, txt: 'Average rate', index: index),
          ],
        ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryDetails(color: Colors.lime, txt: 'Plus', index: index),
              CategoryDetails(color: Colors.pink, txt: 'At rest', index: index),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h),
              height: 65.h,
              width: 350.w,
              child: buildButton('Make'+'\t'+categories[index].title.toString(),(){}, Colors.teal))
        ],
      ),
    );
  }
}
