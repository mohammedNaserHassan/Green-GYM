import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/Tabs/HomeScreen.dart';
import 'package:gym_app/Tabs/Account.dart';
import 'package:gym_app/Tabs/Category.dart';
import 'package:gym_app/Tabs/Worksout.dart';
import 'package:gym_app/Theme/Theme_Services.dart';

import '../Models/Category.dart';
import '../Screens/Home.dart';

class GymController extends GetxController{
   String message = DateTime.now().hour < 12 ? "Good morning" : "Good afternoon";
  GymController(){
    pageController = PageController(initialPage: selectedIndex);
  }
  late PageController pageController;
  List<Widget> items=[HomeScreen(),Worksout(),Category(),Account()];
  int selectedIndex = 0;

  onButtonPressed(int index) {
      selectedIndex = index;
    pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
    update();
  }

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
    count=categories.length;
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
