import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/pages/application/widget/flutter_toast.dart';
import 'package:project_fl_bloc/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext contextController;
  const RegisterController({required this.contextController});

  //create a method
  void handledEmailRegister() async {
    final stateController = contextController.read<RegisterBlocs>().state;
    String userNameController = stateController.userNameState;
    String emailController = stateController.emailAddressState;
    String passwordController = stateController.passwordState;
    String confirmPasswordController = stateController.confirmPasswordState;

    if (userNameController.isEmpty) {
      toastInfo(msg: "Your username cannot be empty");
      return;
    }
    if (emailController.isEmpty) {
      toastInfo(msg: "Your email cannot be empty");
      return;
    }
    if (passwordController.isEmpty) {
      toastInfo(msg: "Your password cannot be empty");
      return;
    }
    if (confirmPasswordController.isEmpty) {
      toastInfo(msg: "Your password confirmation is incorrect");
      return;
    }

    try {
      //credential
      final credentialRegis = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController, password: passwordController);

      //check user object from credential
      if (credentialRegis.user != null) {
        //Let the User verified
        await credentialRegis.user?.sendEmailVerification();
        //show the name has been verified
        await credentialRegis.user?.updateDisplayName(userNameController);
        //message
        toastInfo(
            msg:
                "An email has been send to your registered email.\nTo activate it, please check your email box and click on the link");
        Navigator.of(contextController).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email ID is invalid");
      }
    }
  }
}
