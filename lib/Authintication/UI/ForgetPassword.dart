import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym_app/Authintication/UI/LoginScreen.dart';
import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:gym_app/Widgets/buildButton.dart';
import 'package:gym_app/Widgets/buildTextField.dart';
class ForgetPassword extends StatelessWidget {
   ForgetPassword({Key? key}) : super(key: key);

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
                height: 400.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Images/password.PNG',),
                        fit: BoxFit.fill
                  )
                ),
              ),
              Positioned(
                bottom: 130.h,
                left: 20.w,
                right: 20.w,
                child: Container(
                  height: 300.h,
                  margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
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
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Text('We will send a mail to the email address',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.normal,fontSize: 15),),
                      Text('you registered to regain your password',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.normal,fontSize: 15),),
                      buildTextField(prefex: Icons.email, title: 'json@gmail.com', controller: getx.emailPass),
                      SizedBox(height: 20.h,),
                      Text('Email sent to ex*****@gmail.com',style: TextStyle(color: Colors.orange,fontSize: 15),),
                      SizedBox(height: 20,),
                     buildButton('Send',getx.resetPassword, Colors.teal)
                    ],
                  ),
                ),
              ),
               Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap:(){
                    Get.off(LoginScreen());
                  } ,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
