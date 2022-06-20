import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Screens/InfoScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => Get.off(InfoScreen()));
    return Material(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: Theme.of(context).canvasColor,
              radius: 55,
              child: Icon(
                Icons.sports_handball,
                color: Colors.teal,
                size: 60.sp,
              )),
          Text(
            'Fitness',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
            child: LinearProgressIndicator(
              color: Theme.of(context).textTheme.bodyText1?.color,
              minHeight: 10.h,
              backgroundColor: Colors.transparent,
            ),
          ),
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
