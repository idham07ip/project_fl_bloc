import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_fl_bloc/common/values/colors.dart';
import 'package:project_fl_bloc/common/widget/application_widget.dart';
import 'package:project_fl_bloc/pages/bloc/app_blocs.dart';
import 'package:project_fl_bloc/pages/bloc/app_events.dart';
import 'package:project_fl_bloc/pages/bloc/app_states.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  //Declare Variable
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(_index),

              //Make Bottom Navigation Bar
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: _index,
                  onTap: (value) {
                    //Triggered UI
                    context.read<AppBlocs>().add(TriggerAppEvents(value));
                  },
                  elevation: 0,
                  //Type of BNB
                  type: BottomNavigationBarType.fixed,

                  //Show Selected Labels
                  showSelectedLabels: false,

                  //Unselected Labels
                  showUnselectedLabels: false,

                  //Selected Item Colors
                  selectedItemColor: AppColors.primaryElement,

                  //Unselected Item Color
                  unselectedItemColor: AppColors.primaryFourElementText,

                  //Items
                  items: [
                    //Home
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/home.png"),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          "assets/icons/home.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),

                    //Search
                    BottomNavigationBarItem(
                      label: "Search",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/search2.png"),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          "assets/icons/search2.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),

                    //Course
                    BottomNavigationBarItem(
                      label: "Course",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/play-circle1.png"),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          "assets/icons/play-circle1.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),

                    //ChatPage
                    BottomNavigationBarItem(
                      label: "Chat",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/message-circle.png"),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          "assets/icons/message-circle.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),

                    //ProfilePage
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset("assets/icons/person2.png"),
                      ),
                      activeIcon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(
                          "assets/icons/person2.png",
                          color: AppColors.primaryElement,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
