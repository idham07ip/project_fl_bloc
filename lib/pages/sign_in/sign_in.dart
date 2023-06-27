import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_events.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_state.dart';
import 'package:project_fl_bloc/pages/sign_in/widget/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //GOOGLE ACCOUNT, IPHONE ACCOUNT AND FACEBOOK ACCOUNT
                  buildThirdPartyLogin(context),

                  //
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 42.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h),

                        //TEXTFIELD EMAIL
                        buildTextField(
                            "Enter your email address", "email", "user",
                            (value) {
                          //Triggered event email
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(height: 5.h),

                        //TEXTFIELD PASSWORD
                        buildTextField(
                            //Triggered event password
                            "Enter your password",
                            "password",
                            "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),

                        //Forgot Password
                        forgotPassword(),

                        //LOGIN
                        buildLoginAndRegistButton("Login", "login", () {
                          print("login Button");
                        }),

                        //REGISTER
                        buildLoginAndRegistButton(
                            "Register", "register", () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
