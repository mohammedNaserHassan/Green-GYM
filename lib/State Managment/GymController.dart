import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Theme/Theme_Services.dart';

class GymController extends GetxController{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  changeThemeMode(){
    ThemeServices().changeThemeMode();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    update();
  }

int count=2;
  increaseCount(){
    count=8;
    update();
  }

  bool stateMode =false;
  setState(){
    stateMode=!stateMode;
    update();
  }
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController conformPassword=TextEditingController();
  TextEditingController name=TextEditingController();
  }
