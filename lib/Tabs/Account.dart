import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/State%20Managment/GymController.dart';

import '../Widgets/buildTrainings.dart';
import '../Widgets/buildWorksOut.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymController>(
      init: GymController(),
      builder: (getx) => SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.h,
              child: Stack(
                children: [
                  Container(
                    height: 180.h,
                    width: 300.w,
                    margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(getx.user.imgurl,),
                              radius: 35.sp,
                            ),
                            Positioned(
                              bottom: 0.h,
                              right: 0.w,
                              child: CircleAvatar(
                                backgroundColor: Colors.lightGreen,
                                radius: 10.sp,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          getx.user.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontSize: 15.sp),
                        ),
                        Text(
                          'Palestine, Gaza , Naser',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10.h,
                    right: 40.w,
                    left: 40.w,
                    child: Container(
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  buildText('50', 22.sp, context),
                                  buildText('kg', 12.sp, context),
                                  SizedBox(
                                    width: 45.w,
                                  ),
                                  buildText('182', 22.sp, context),
                                  buildText('cm', 12.sp, context),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  buildText('15', 22.sp, context),
                                  buildText('%', 12.sp, context),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  buildText('Weight', 12.sp, context),
                                  buildText('Height', 12.sp, context),
                                  buildText('Fat', 12.sp, context),
                                ],
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListTile(
              title: Text(
                'Popular Category',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: Text(
                  'See All +',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 18.sp),
                ),
              ),
            ),
            buildWorksout(),
            ListTile(
              title: Text(
                'Additional Trainings',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: Text(
                  'See All +',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 18.sp),
                ),
              ),
            ),
            buildTrainings(),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(String txt, double size, BuildContext context) => Text(txt,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontSize: size,
          ));
}
