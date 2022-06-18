import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Screens/Auth/LoginRegister.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Screens/InfoScreen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => Get.off(InfoScreen()));
    return Material(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Images/Capture.PNG',height: 150.h,),
          Text('Fitness',style: Theme.of(context).textTheme.bodyText1,),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(20),
            child: LinearProgressIndicator(
              color: Colors.white,
              minHeight: 10.h,
              backgroundColor: Colors.transparent,
            ),
          ),
          Text('Loading...',style: Theme.of(context).textTheme.subtitle1,)
        ],
      ),
    );
  }
}
