import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_fl_bloc/pages/common_widgets.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_events.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_state.dart';
import 'package:project_fl_bloc/pages/sign_in/sign_in_controller.dart';

import '../sign_in/bloc/sign_in_blocs.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBarRegister("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: reusableText(
                        "Enter your details below and free sign up")),
                Container(
                  margin: EdgeInsets.only(top: 42.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Text for Username
                      reusableText("Username"),

                      //TEXTFIELD USERNAME
                      buildTextField("Enter your username", "name", "user",
                          (value) {
                        //Triggered event email
                        //context.read<SignInBloc>().add(EmailEvent(value));
                      }),

                      reusableText("Email"),

                      //TEXTFIELD EMAIL
                      buildTextField(
                          "Enter your email address", "email", "user", (value) {
                        //Triggered event email
                        //context.read<SignInBloc>().add(EmailEvent(value));
                      }),

                      //
                      reusableText("Password"),

                      //TEXTFIELD PASSWORD
                      buildTextField(
                          //Triggered event password
                          "Enter your password",
                          "password",
                          "lock", (value) {
                        //context.read<SignInBloc>().add(PasswordEvent(value));
                      }),

                      //Text for confirm password
                      reusableText("Confirm Password"),

                      //TEXTFIELD PASSWORD
                      buildTextField(
                          //Triggered event password
                          "Enter your confirm password",
                          "password",
                          "lock", (value) {
                        //context.read<SignInBloc>().add(PasswordEvent(value));
                      }),

                      //Forgot Password
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: reusableText(
                            "By creating an account you have to agree\nwith our term & condition."),
                      ),

                      //REGISTER
                      buildLoginAndRegistButton("Sign up", "login", () {
                        //pass and event
                        Navigator.of(context).pushNamed("register");
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
