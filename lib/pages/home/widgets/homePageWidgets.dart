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

Widget searchViewHomePage() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset(
                "assets/icons/search.png",
              ),
            ),
            //
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: "Search your course",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),

      //Filter_Search
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset(
            "assets/icons/options.png",
          ),
        ),
      )
    ],
  );
}

Widget slidersMenuViewHomePage() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          children: [
            _slidersContainer(pathImage: "assets/icons/Art.png"),
            _slidersContainer(pathImage: "assets/icons/Art.png"),
            _slidersContainer(pathImage: "assets/icons/Art.png"),
          ],
        ),
      ),
    ],
  );
}

//Sliders_widget
Widget _slidersContainer({String pathImage = "assets/icons/Art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          "assets/icons/Art.png",
        ),
      ),
    ),
  );
}
