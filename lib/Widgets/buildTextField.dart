import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class buildTextField extends StatelessWidget {
 String title;
 TextEditingController controller;
 IconData prefex;
 bool state;
 buildTextField({required this.prefex,required this.title,required this.controller,this.state=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 15.h,horizontal: 30.w),
      child: TextField(
        obscureText: state,
        style: Theme.of(context).textTheme.bodyText2,
        controller: controller,
        decoration: InputDecoration(
            hintText: title,
            hintStyle: Theme.of(context).textTheme.bodyText2,
            fillColor: Theme.of(context).primaryColor,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            ),
            filled: true,
            border: InputBorder.none,
            prefixIcon: Icon(prefex,color: Theme.of(context).textTheme.bodyText1?.color)
        ),
      ),
    );
  }
}
