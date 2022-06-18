import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class buildButton extends StatelessWidget {
  String text;
  VoidCallback function;
  Color color;
   buildButton(this.text,this.function,this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 270.w,
        height: 40.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color
        ),
      ),
    );
  }
}
