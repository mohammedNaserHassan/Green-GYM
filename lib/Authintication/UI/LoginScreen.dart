import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Authintication/UI/ForgetPassword.dart';
import 'package:gym_app/Authintication/UI/RegisterScreen.dart';
import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:gym_app/Screens/Home.dart';

import '../../Widgets/buildButton.dart';
import '../../Widgets/buildTextField.dart';
import '../../Tabs/HomeScreen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Color(0xffFDF2F8),
        child: GetBuilder<GymController>(
          init: GymController(),
          builder:(getx)=> Stack(
            children: [
              Container(
                height: 330.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage('assets/Images/lo.PNG',),fit: BoxFit.fitWidth)
                ),
              ),
              Positioned(
                bottom: 150.h,
                left: 10.w,
                right: 10.w,
                child: Container(
                  height: 350.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal,
                    spreadRadius: 1,
                    blurRadius: 1
                  )
                ],
                  color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(15)
              ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        children: [
                          SizedBox(height: 10.h,),
                          Text('Login To GYM App',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 23),),
                          buildTextField(title: 'Email',prefex: Icons.email,controller: getx.email),
                          buildTextField(title: 'Password',prefex: Icons.lock,controller: getx.password,state: true),
                          SizedBox(height: 10.h,),
                       GymController.loginLoad?CircularProgressIndicator(color: Colors.teal,): buildButton('Login',(){
                          getx.login();
                        },Colors.teal),
                          Container(
                            margin: EdgeInsets.only(top: 10.h,left: 120.w),
                            child: GestureDetector(
                              onTap: (){
                                Get.off(ForgetPassword());
                              },
                                child: Text('Forget Password?',style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),)),
                          )
                        ],
                      ),
                    ),
                  )
                ),
              ),
              Positioned(
                bottom: 30.w,
                left: 40.w,
                child: Row(
                  children: [
                    Text('Don\’t have an account?'),
                    SizedBox(width: 20.w,),
                    GestureDetector(
                        onTap: (){
                          Get.off(RegisterScreen());
                        },
                        child: Text('Sign Up!',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

