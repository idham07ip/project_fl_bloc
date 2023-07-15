import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fl_bloc/common/values/colors.dart';
import 'package:project_fl_bloc/pages/home/widgets/homePageWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBarHomePage(),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText(
              "Welcome to",
              colorText: AppColors.primaryThirdElementText,
              top: 20,
            ),
            homePageText(
              "Learning Course",
              colorText: AppColors.primaryText,
              top: 20,
            ),

            SizedBox(height: 20.h),

            //Search Feature
            searchViewHomePage(),

            //Card_Menu
            slidersMenuViewHomePage(),
          ],
        ),
      ),
    );
  }
}
