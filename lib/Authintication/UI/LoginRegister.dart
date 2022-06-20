import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Authintication/UI/LoginScreen.dart';
import 'package:gym_app/Authintication/UI/RegisterScreen.dart';



import '../../Widgets/buildButton.dart';

class LoginRegister extends StatelessWidget {
  LoginRegister();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffFDF2F8),
      child: Stack(
        children: [
          SafeArea(child: Image.asset('assets/Images/splash.PNG',fit: BoxFit.fill,height: 420.h,width: double.infinity,)),
          Positioned(
            bottom:25,
            right: 25,
            left: 20,
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h,),
                  Text('Welcome To',style: Theme.of(context).textTheme.bodyText1,),
                  Text(' Fitness Mobile App',style: Theme.of(context).textTheme.bodyText1,),
                  SizedBox(height: 20.h,),
                  Text('Deliver your order around the world',style: Theme.of(context).textTheme.bodyText2,),
                  Text('without destination',style: Theme.of(context).textTheme.bodyText2,),
                  SizedBox(height: 10.h,),
                  buildButton('Login',(){
                    Get.off(()=>LoginScreen());
                  },Colors.teal),
                  buildButton('Register',(){
                    Get.off(()=>RegisterScreen());
                  },Colors.orange),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

