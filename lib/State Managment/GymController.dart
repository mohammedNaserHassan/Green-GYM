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
import 'package:gym_app/Models/Slider.dart';
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

class GymController extends GetxController {
  GymController() {
    pageController = PageController(initialPage: selectedIndex);
    scrollController = ScrollController();
    getUserFromFirestore();
  }

  ScrollController? scrollController;
  String message = DateTime.now().hour < 12 ? "Good morning" : "Good afternoon";
  static bool isLoading = false;
  static bool loginLoad = false;
  late PageController pageController;
  List<Widget> items = [HomeScreen(), Worksout(), Category(), Account()];
  int selectedIndex = 0;

  registerLoadin() {
    isLoading = false;
    update();
  }

  onButtonPressed(int index) {
    selectedIndex = index;
    pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
    update();
  }


  List days = [
    'Today',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  changeThemeMode() {
    ThemeServices().changeThemeMode();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    update();
  }

  int count = 2;

  increaseCount() {
    count = categories.length;
    update();
  }

  bool stateMode = false;

  setState() {
    stateMode = !stateMode;
    update();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController emailPass = TextEditingController();

//////////////////Reset Password////////////////////////
  resetPassword() async {
    if (emailPass.text.length != 0) {
      await Auth_helper.auth_helper.resetPassword(emailPass.text.trim());
      clearController();
      Get.off(LoginScreen());
    } else {
      Fluttertoast.showToast(msg: 'Please Enter your email address');
    }
  }

/////////////

  //upload Image
  File? file;

  selectFile() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile!.path);
    update();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////////////////////////////////////////////////////////////////////////////////////

  /////Sign up//////////////////////////////
  register() async {
    if (name.text.length != 0 &&
        email.text.length != 0 &&
        password.text.length != 0 &&
        conformPassword.text.length != 0 &&
        file != null) {
      if (password.text == conformPassword.text) {
        try {
          UserCredential? userCredential =
              await Auth_helper.auth_helper.signup(email.text, password.text);
          String imageUrl = await fireStorageHelper.helper.uploadImage(file);
          RegisterRequest registerRequest = RegisterRequest(
            imgurl: imageUrl,
            id: userCredential?.user?.uid,
            email: email.text,
            name: name.text,
          );
          await fireStore_Helper.helper.addUserToFireBase(registerRequest);
          await Auth_helper.auth_helper.signOut();
          clearController();
        } on Exception catch (e) {
          print(e);
        }
      } else {
        Fluttertoast.showToast(msg: 'Password not match');
      }
    } else {
      Fluttertoast.showToast(msg: 'Please fill all the fields');
    }
    update();
  }

////////////////////////////////////////////////

  //////Login////////////////////////////////////
  String? userId;

  login() async {
    if (email.text.length != 0 && password.text.length != 0) {
      UserCredential? userCredential =
          await Auth_helper.auth_helper.signin(email.text, password.text);
      getUserFromFirestore();
      userId = Auth_helper.auth_helper.getUserId();
      clearController();
    } else {
      Fluttertoast.showToast(msg: "Please fill all the fields");
    }
    update();
  }

  RegisterRequest user =
      RegisterRequest(name: '', email: '', imgurl: '', id: '');

  getUserFromFirestore() async {
    user = await fireStore_Helper.helper.getUserFromFirestore();
    update();
  }

  ///////////////

  checkEnter() {
    bool isLoggin = Auth_helper.auth_helper.checkUser();
    if (isLoggin) {
      this.userId = Auth_helper.auth_helper.getUserId();
      getUserFromFirestore();
      Get.off(Home());
    } else {
      Get.off(LoginRegister());
    }
  }

  //////////////////Sign out////////////////////////////////////
  logOut() async {
    await Auth_helper.auth_helper.signOut();
    userId = null;
    Get.off(LoginRegister());
    isLoading = false;
    loginLoad = false;
    update();
  }

//////////////Clear Controller ///////

  clearController() {
    email.clear();
    password.clear();
    conformPassword.clear();
    name.clear();
    file = null;
    emailPass.clear();
  }
  ///////////////////////////////////////////////////////////////////////////////

//// choose date ///////////////
  int selectedValue=0;
  pickerDay(BuildContext context){
    showDialog(context: context, builder: (c)=>CupertinoAlertDialog(
content:   CupertinoPicker(
  magnification: 5,
    diameterRatio: 5,
    itemExtent: 20,
    backgroundColor: Theme.of(context).canvasColor,
    onSelectedItemChanged:  (value) {
        selectedValue = value;
        Get.back();
    },
    children: [
      Text('0',style: TextStyle(color:  Colors.teal),),
      Text('1',style: TextStyle(color: Colors.teal)),
      Text('2',style: TextStyle(color: Colors.teal)),
      Text('3',style: TextStyle(color:  Colors.teal)),
      Text('4',style: TextStyle(color:  Colors.teal)),
      Text('5',style: TextStyle(color:  Colors.teal)),
      Text('6',style: TextStyle(color:Colors.teal)),
      Text('7',style: TextStyle(color:Colors.teal))
    ]),
    ));
    update();
  }
}
