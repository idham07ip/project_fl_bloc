import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_fl_bloc/common/values/colors.dart';

AppBar buildAppBarHomePage() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(
        left: 7.w,
        right: 7.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset(
              "assets/icons/menu.png",
            ),
          ),

          //USER_AVATAR
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/person.png",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageText(String textDynamic,
    {Color colorText = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(
      top: 2.5.h,
    ),
    child: Text(
      textDynamic,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: colorText,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
