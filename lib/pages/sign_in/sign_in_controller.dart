import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        if (emailAddress.isEmpty) {
          //
        }
        if (password.isEmpty) {
          //
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          //Get the information null
          if (credential.user == null) {
            //if user doesn't exist
            print("User does not exist");
          }
          //Verified Email and Email Exist
          if (!credential.user!.emailVerified) {
            //
          }

          //if user not null
          var user = credential.user;
          if (user != null) {
            //Got verified user from firebase
            print("User exist");
          } else {
            //have an error getting user from firebase
            print("No User");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user');
          } else if (e.code == 'invalid-email') {
            print("Your email format is incorrect.");
          }
        }
      }
    } catch (e) {}
  }
}
