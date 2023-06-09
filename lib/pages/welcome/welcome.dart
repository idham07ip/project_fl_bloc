import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fl_bloc/common/values/colors.dart';
import 'package:project_fl_bloc/common/values/constant.dart';
import 'package:project_fl_bloc/global.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (contex, state) {
          return Container(
            margin: EdgeInsets.only(
              top: 34.h,
            ),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                //
                //Slide Page Feature
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(contex).add(WelcomeEvent());
                    // print("index value is ${index}");
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "Next",
                      "First See Learning",
                      "Forget About a for of paper all knowledge in on learning",
                      "assets/images/reading.png",
                    ),
                    _page(
                      2,
                      context,
                      "Next",
                      "Connect With Everyone",
                      "Always Keep in touch with your purpose & friends. Let's get connected",
                      "assets/images/boy.png",
                    ),
                    _page(
                      3,
                      context,
                      "Get Started",
                      "Always Facinated Learning",
                      "Anywhere. Anytime. The time is at your our discrtion, so study whenever you want ",
                      "assets/images/man.png",
                    ),
                  ],
                ),

                //Dots Indicator
                Positioned(
                  bottom: 60.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: AppColors.primaryThirdElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(17.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),

        //
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),

        //
        GestureDetector(
          onTap: () {
            //within 0-2 index
            if (index < 3) {
              //animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              //
              //Jump to a new page
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
              print("-1");
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              // print(
              //     "The value is ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 100.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,

            //
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15.w,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),

            //TextButton
            child: Center(
              child: Text(
                buttonName,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
