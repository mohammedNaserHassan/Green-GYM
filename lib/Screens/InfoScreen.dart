import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:gym_app/Models/Slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/State%20Managment/GymController.dart';

import '../Authintication/UI/LoginRegister.dart';
import '../Widgets/buildButton.dart';
class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselSliderController sliderController=CarouselSliderController();
    return GetBuilder<GymController>(
      init: GymController(),
      builder: (getx) {
        return SafeArea(
          child: Material(
            color: Color(0xffFDF2F8),
            child: CarouselSlider.builder(
              itemCount: sliders.length,
              slideBuilder: (index)=>Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 420.h,
                    child: Image.asset(sliders[index].image,fit: BoxFit.fill,),
                  ),
                  Positioned(
                    bottom: 160.h,
                    left: 25.w,
                    right: 25.w,
                    child: Container(
                      width: double.infinity,
                      height: 270.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).primaryColor,
                      ),
                   child:   Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        SizedBox(height: 30.h,),
                      Text(sliders[index].title1,style: Theme.of(context).textTheme.bodyText1,),
                      Text(sliders[index].title2,style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(height: 20.h,),
                      Text(sliders[index].subTitle1,style: Theme.of(context).textTheme.bodyText2,),
                      Text(sliders[index].subTitle2,style: Theme.of(context).textTheme.bodyText2,),
                          SizedBox(height: 20.h,),
                          buildButton('Get Started',(){
                            getx.checkEnter();
                          },Colors.teal)
                        ]),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 150.w,
                    right: 150.w,
                    child: Container(
                      child: buildButton('Skip', (){
                        getx.checkEnter();
                      },Colors.orange),
                    ),
                  )
                ],
              ),
              controller: sliderController,
              slideTransform: CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 100.h),
                indicatorBorderColor: Colors.grey,
                currentIndicatorColor: Colors.teal,
                indicatorRadius: 5,
              ),
            ),
          ),
        );
      }
    );
  }
}
