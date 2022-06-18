import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Models/Slider.dart';
import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:gym_app/Widgets/buildButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymController>(
      init: GymController(),
      builder: (getx) => Scaffold(
        key: getx.scaffoldKey,
        drawer: Drawer(
          backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
      padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: (){},
          )
        ],
      ),
    ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 800.h,
                ),
                Container(
                  width: double.infinity,
                  height: 200.h,
                  color: Colors.teal,
                ),
                Positioned(
                    top: 70.h,
                    left: 20.w,
                    child: Text(
                      'Hi Mohammed Shweikh',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                    top: 110.h,
                    left: 20.w,
                    child: Text(
                      'Good Morning',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                Positioned(
                    right: 20.w,
                    top: 20.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: IconButton(
                          onPressed: () {
                            getx.changeThemeMode();
                            getx.setState();
                          },
                          icon: !getx.stateMode
                              ? Icon(
                                  Icons.light_mode,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.dark_mode,
                                  color: Colors.white,
                                )),
                    )),
                Positioned(
                    left: 20.w,
                    top: 20.h,
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () {
                              getx.openDrawer();
                            },
                            icon: Icon(
                              Icons.format_align_left_sharp,
                              color: Colors.white,
                            )))),
                Positioned(
                    top: -60.h,
                    right: 50.w,
                    child: Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white38),
                    )),
                Positioned(
                    top: -60.h,
                    right: 150.w,
                    child: Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white38),
                    )),
                Positioned(
                    top: 80.h,
                    right: -5.w,
                    child: Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white38),
                    )),
                Positioned(
                  top: 170.h,
                  left: 0.w,
                  right: 0.w,
                  child: Container(
                    height: 600.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                        color: Theme.of(context).primaryColor),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 30.w),
                              child: Text(
                                'Popular Workout',
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                          Container(
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
                          ),
                          ListTile(
                            title: Text(
                              'Category',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: GestureDetector(
                              onTap: (){
                                getx.increaseCount();
                              },
                              child: Text(
                                'See All +',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(fontSize: 18.sp),
                              ),
                            ),
                          ),
                          Container(
                            height: 170.h,
                            margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: getx.count,
                              itemBuilder: (context, index) => Container(
                                width:160.w,
                                margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                color: Theme.of(context).buttonColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).buttonColor,
                                    blurRadius: 10.h,
                                    offset: Offset(0.w, 10.w),
                                  ),
                                ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      child: Icon(Icons.fitness_center,color: Colors.white,),
                                      backgroundColor: Colors.teal,
                                    ),
                                    SizedBox(height: 10.h,),
                                    Text('Information',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20.sp),),
                                  ],
                                ),
                            )
                          ),),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Text(
                              'Additional Training',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: workouts.length,
                            itemBuilder: (context,index)=>Container(
                              height: 120.h,
                              margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).buttonColor,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
