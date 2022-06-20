import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/Authintication/Helper/fireStorageHelper.dart';
import 'package:gym_app/Authintication/Helper/fireStore_Helper.dart';
import 'package:gym_app/Authintication/UI/LoginRegister.dart';
import 'package:gym_app/Authintication/UI/LoginScreen.dart';
import 'package:gym_app/Tabs/HomeScreen.dart';
import 'package:gym_app/Tabs/Account.dart';
import 'package:gym_app/Tabs/Category.dart';
import 'package:gym_app/Tabs/Worksout.dart';
import 'package:gym_app/Theme/Theme_Services.dart';
import 'package:image_picker/image_picker.dart';

import '../Authintication/Helper/auth_helper.dart';
import '../Models/Category.dart';
import '../Models/User.dart';
import '../Screens/Home.dart';
import '../Screens/InfoScreen.dart';

class GymController extends GetxController{
  GymController(){
    pageController = PageController(initialPage: selectedIndex);
    getUserFromFirestore();
  }
  String message = DateTime.now().hour < 12 ? "Good morning" : "Good afternoon";
   bool isLoading = false;
   bool loginLoad=false;
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

  //upload Image
   File? file;
   selectFile() async {
     XFile? imageFile =
     await ImagePicker().pickImage(source: ImageSource.gallery);
     this.file = File(imageFile!.path);
     update();
   }
   ////////////////////////////////////////////////////////////////////////////////////////////////
setLoading(){
     isLoading=!isLoading;
     update();
}

   ////////////////////////////////////////////////////////////////////////////////////////////////

   /////Sign up//////////////////////////////
   register() async {
   if(name.text.length!=0&&email.text.length!=0&&password.text.length!=0&&conformPassword.text.length!=0){
     if(password.text==conformPassword.text){
     try {
       UserCredential? userCredential = await Auth_helper.auth_helper.signup(email.text, password.text);
       setLoading();
       String imageUrl = await fireStorageHelper.helper.uploadImage(file);
       RegisterRequest registerRequest = RegisterRequest(
         imgurl: imageUrl??'',
         id: userCredential?.user?.uid,
         email: email.text,
         name: name.text,);
       await fireStore_Helper.helper.addUserToFireBase(registerRequest);
       await Auth_helper.auth_helper.signOut();
       Get.off(LoginScreen());
     } on Exception catch (e) {
       print(e);
     }
     clearController();
     }
     else{
       Fluttertoast.showToast(msg: 'Password not match');
     }
   }
   else {
      Fluttertoast.showToast(msg: 'Please fill all the fields');
   }
     update();
   }

////////////////////////////////////////////////
  //////Login////////////////////////////////////
  String? userId;
  login() async {
     if(email.text.length!=0 && password.text.length!=0){
    UserCredential? userCredential = await Auth_helper.auth_helper.signin(email.text, password.text);
    loginLoad=true;
    getUserFromFirestore();
userId = Auth_helper.auth_helper.getUserId();
setLoading();
    clearController();
   }
    else{
    Fluttertoast.showToast(msg: "Please fill all the fields");
    }
     update();
  }

  RegisterRequest user=RegisterRequest(name: '',email: '',imgurl: '',id: '');

  getUserFromFirestore() async {
    user = await fireStore_Helper.helper.getUserFromFirestore();
    update();
  }
  ///////////////
checkEnter(){
    if(userId==null){
      Get.off(LoginRegister());
    }else{
      Get.off(Home());
    }
}
  //////////////////Sign out////////////////////////////////////
  logOut() async {
    await Auth_helper.auth_helper.signOut();
    user=RegisterRequest(name: '',email: '',imgurl: '',id: '');
    userId=null;
    Get.off(LoginRegister());
    setLoading();
    loginLoad=false;
    update();
  }
/////////////////////

  clearController(){
    email.clear();
    password.clear();
    conformPassword.clear();
    name.clear();
  }

}
