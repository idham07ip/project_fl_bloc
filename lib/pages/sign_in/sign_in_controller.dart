import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/common/widget/flutter_toast.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        //
        if (emailAddress.isEmpty) {
          //EMAIL KOSONG
          // print("email empty");
          toastInfo(msg: "You need to fill email address.");
          return;
          // print("email is $emailAddress");
        }
        if (password.isEmpty) {
          //PASSWORD KOSONG
          // print("password empty");
          toastInfo(msg: "You need to fill password address.");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          //MENDAPATKAN INFORMASI NULL
          if (credential.user == null) {
            //if user doesn't exist
            // print("User does not exist");
            toastInfo(msg: "Your account doesn't exist.");
            return;
          }
          //
          if (!credential.user!.emailVerified) {
            //Account  verified
            // print("not verified");
            toastInfo(msg: "You need to verified email account");
            return;
          }

          //if user not null
          var user = credential.user;

          //
          if (user != null) {
            //Got user exist from firebase
            print("User exist");
          } else {
            //have an error getting user from firebase
            print("No User");
            toastInfo(msg: "Currently you are not a user of this application");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user for that email.');
            toastInfo(msg: "No user for that email.");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
            toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            print("Your email format is incorrect.");
            toastInfo(msg: "Your email addres format is incorrect.");
          }
        }
      }
    } catch (e) {}
  }
}
