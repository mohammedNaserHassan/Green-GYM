import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Models/Slider.dart';
import 'package:gym_app/Screens/Home.dart';
import 'package:gym_app/State%20Managment/GymController.dart';

import 'BookingScreen.dart';
import 'TrainingPage.dart';

class WorkoutsDetails extends StatelessWidget {
  Workout workout;

  WorkoutsDetails(this.workout);

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
            'Workout program',
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                Get.to(BookingScreen());
              },
              child: CircleAvatar(
                child: Icon(Icons.bookmark,color: Colors.teal,),
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
                  child: Icon(Icons.arrow_back,color: Colors.teal,),
                  backgroundColor: Theme.of(context).canvasColor,
                )),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
           getx.scrollController?.jumpTo(getx.scrollController?.position.maxScrollExtent??0);
          },
          backgroundColor: Colors.transparent,
          elevation: 5,
          mini: true,
          child: Icon(Icons.keyboard_arrow_down,color: Theme.of(context).textTheme.bodyText1?.color,),
        ),
        body: SingleChildScrollView(
          controller: getx.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 370.h,
                color: Theme.of(context).primaryColor,
                child: Stack(
                  children: [
                    Container(
                      height: 330.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(workout.image),
                              fit: BoxFit.fill)),
                    ),
                    Positioned(
                      right: 30.w,
                      left: 30.w,
                      top: 125.h,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(TrainingPage(workout.id));
                        },
                        child: CircleAvatar(
                          radius: 30.sp,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 35.sp,
                          ),
                          backgroundColor: Colors.white70,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.h,
                      right: 40.w,
                      left: 40.w,
                      child: Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                              color: Theme.of(context).highlightColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    buildText('Day', 22.sp, context),
                                    SizedBox(
                                      width: 45.w,
                                    ),
                                    buildText('Time', 22.sp, context),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    buildText('Rate', 22.sp, context),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    buildText('Sunday', 12.sp, context),
                                    buildText(workout.time, 12.sp, context),
                                    buildText(workout.rate, 12.sp, context),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Text(
                    workout.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 20.sp),
                  )),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                child: Text (" Every person in the world would like to have a perfect body. In order to have a healthy and a strong body, people would need to consider going to a gym to work out. What do such people expect of a gym? Certainly, patrons would expect a wide selection of equipment available in a gym. Patrons would enjoy a well-educated staff who knows everything people want to know about working out. The Bally Total Fitness, located on the Boulevard, is a perfect match for that. Patrons will definitely enjoy working out at the Bally Total Fitness. What kind of environment would patrons expect? Patrons will find the Bally Total Fitness clean, well organized, and suitable for working out. ")    ),

                         ],
          ),
        ),
      ),
    );
  }

  Text buildText(String txt, double size, BuildContext context) => Text(txt,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: size,
          ));
}
