import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../State Managment/GymController.dart';
import '../Widgets/trainingRow.dart';

class BookingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymController>(
        init: GymController(),
        builder: (getx) => Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              appBar: AppBar(
                toolbarHeight: 80,
                centerTitle: true,
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                title: Text(
                  'Booking Schedule',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 20),
                ),
                actions: [
                  GestureDetector(
                    onTap: (){
                      getx.pickerDay(context);
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.calendar_month,
                        color: Colors.teal,
                      ),
                      backgroundColor: Theme.of(context).canvasColor,
                    ),
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
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.teal,
                        ),
                        backgroundColor: Theme.of(context).canvasColor,
                      )),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      height: 115.h,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: getx.days.length,
                        itemBuilder: (context,index)=>Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
                          width: 110.w,
                          height: 110.h,
                          decoration: BoxDecoration(
                            color: index==getx.selectedValue?Colors.teal:Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(getx.days[index],style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20.sp),),
                              SizedBox(height: 5.h,),
                              Text('$index',style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey),),
                            ],
                          ),
                        ),
                      ),
                    ),

                 ListView.builder(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: 4,
                   itemBuilder: (context,index)=>Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                           margin: EdgeInsets.only(left: 20.w,top: 10.h),
                           child: Text('${index+2}'+':00'+'\t'+'AM',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22),)),
                       Container(
                         margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
                         height: 120.h,
                         decoration: BoxDecoration(
                           color: Theme.of(context).canvasColor,
                           borderRadius: BorderRadius.circular(20),
                           border: Border.all(color: Colors.teal)
                         ),
                         child:TrainingRow(index)
                       )
                     ],
                   ),
                 )

                  ],
                ),
              ),
            ));
  }
}
