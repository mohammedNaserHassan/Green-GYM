import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/State%20Managment/GymController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GymController>(
      init: GymController(),
      builder:(getx)=> SafeArea(
        child: Scaffold(
            drawer: Drawer(
              backgroundColor: Theme.of(context).canvasColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(getx.user.name,style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 22.sp),),
                    currentAccountPicture:    CircleAvatar(backgroundImage: NetworkImage(getx.user.imgurl),radius: 35.sp,), accountEmail: Text(getx.user.email,style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 10),),
                  ),
                  buildListTile(getx,'Home Screen',0),
                  buildListTile(getx,'My Trainings',1),
                  buildListTile(getx,'My Worksouts',2),
                  buildListTile(getx,'My Profile',3),
                  ListTile(title: Text('Logout'),trailing: Icon(Icons.logout),onTap: (){
                    getx.logOut();
                  },)
                ],
              ),
            ),
            key: getx.scaffoldKey,
          body: Column(
              children: [
            Stack(
              children: [
                Container(
                  height: 747.h,
                ),
                Container(
                  width: double.infinity,
                  height: 200.h,
                  color: Theme.of(context).canvasColor,
                ),
                Positioned(
                    top: 70.h,
                    left: 20.w,
                    child: Text(
                      'Hi'+'\t'+getx.user.name,
                       style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 25.sp,fontWeight: FontWeight.normal,fontFamily: GoogleFonts.aladin().fontFamily),
                    )),
                Positioned(
                    top: 110.h,
                    left: 20.w,
                    child: Text(
                      getx.message,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 25.sp,fontFamily: GoogleFonts.anekKannada().fontFamily),
                    )),
                Positioned(
                    right: 20.w,
                    top: 20.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: IconButton(
                          onPressed: () {
                            getx.changeThemeMode();
                            getx.setState();
                          },
                          icon: !getx.stateMode
                              ? Icon(
                            Icons.light_mode,
                            color:  Theme.of(context).textTheme.bodyText1?.color,
                          )
                              : Icon(
                            Icons.dark_mode,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                          )),
                    )),
                Positioned(
                    left: 20.w,
                    top: 20.h,
                    child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () {
                              getx.openDrawer();
                            },
                            icon: Icon(
                              Icons.format_align_left_sharp,
                                color:  Theme.of(context).textTheme.bodyText1?.color,
                            )))),
                Positioned(
                    top: -60.h,
                    right: 150.w,
                    child: Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.withOpacity(0.5)),
                    )),
                Positioned(
                    top: 15.h,
                    right: 110.w,
                    child: Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.withOpacity(0.5)),
                    )),
                Positioned(
                    top: 80.h,
                    right: -5.w,
                    child: Container(
                      width: 170.w,
                      height: 170.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.withOpacity(0.5)),
                    )),
                Positioned(
                  top: 160.h,
                  left: 0.w,
                  right: 0.w,
                  child: Container(
                    height: 600.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.sp),
                            topLeft: Radius.circular(50.sp)),
                        color: Theme.of(context).primaryColor),
                    child: PageView(
                      controller: getx.pageController,
                      children: getx.items,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                )
              ],
            ),
          ]),
            bottomNavigationBar: SlidingClippedNavBar.colorful(
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor??Theme.of(context).primaryColor,
              onButtonPressed: (index){
                getx.onButtonPressed(index);
              },
              iconSize: 30.sp,
              // activeColor: const Color(0xFF01579B),
              selectedIndex: getx.selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.home,
                  title: 'Home',
                  activeColor: Colors.blue,
                  inactiveColor: Colors.orange,
                ),
                BarItem(
                  icon: Icons.workspaces_sharp,
                  title: 'WorksOut',
                  activeColor: Colors.yellow,
                  inactiveColor: Colors.green,
                ),
                BarItem(
                  icon: Icons.category,
                  title: 'Categories',
                  activeColor: Colors.blue,
                  inactiveColor: Colors.red,
                ),
                BarItem(
                  icon: Icons.person,
                  title: 'Account',
                  activeColor: Colors.cyan,
                  inactiveColor: Colors.purple,
                ),
              ],
            )
        ),
      ),
    );
  }

  ListTile buildListTile(GymController getx,String txt,int index) {
    return ListTile(
                  title: Text(txt,style: GoogleFonts.abhayaLibre(),),
                  onTap: (){
                    getx.onButtonPressed(index);
                    Get.back();
                  },
                );
  }
}
