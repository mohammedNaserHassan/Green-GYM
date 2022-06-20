import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Authintication/UI/LoginScreen.dart';

import 'package:gym_app/State%20Managment/GymController.dart';

import '../../Widgets/buildButton.dart';
import '../../Widgets/buildTextField.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                height: 320.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.teal,
                          spreadRadius: 1,
                          blurRadius: 1
                      )
                    ],
                    image: DecorationImage(image: AssetImage('assets/Images/login.PNG',),fit: BoxFit.fill)
                ),
              ),
              Positioned(
                bottom: 45.h,
                left: 10.w,
                right: 10.w,
                child: Container(
                    height: 550.h,
                    margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 30.w),
                    decoration: BoxDecoration(
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
                            GestureDetector(
                              onTap: () {
                                getx.selectFile();
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5.w),
                                height: 120.h,
                                width: 200.w,
                                child: getx.file == null
                                    ? CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  child: Icon(Icons.add_a_photo_outlined,size: 35.sp,),
                                )
                                    : Image.file(getx.file??File(''),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            buildTextField(title: 'Full Name',prefex: Icons.drive_file_rename_outline,controller: getx.name),
                            buildTextField(title: 'Email',prefex: Icons.email,controller: getx.email),
                            buildTextField(title: 'Password',prefex: Icons.lock,controller: getx.password,state: true),
                            buildTextField(title: 'Conform Password',prefex: Icons.lock,controller: getx.conformPassword,state: true),
                           getx.isLoading?CircularProgressIndicator(): buildButton('Register',(){
                              getx.register();
                            },Colors.teal),
                          ],
                        ),
                      ),
                    )
                ),
              ),
              Positioned(
                bottom: 20.w,
                left: 40.w,
                child: Row(
                  children: [
                    Text('Already have an account?'),
                    SizedBox(width: 20.w,),
                    GestureDetector(
                        onTap: (){
                          Get.off(()=>LoginScreen());
                        },
                        child: Text('SignIn!',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),))
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

