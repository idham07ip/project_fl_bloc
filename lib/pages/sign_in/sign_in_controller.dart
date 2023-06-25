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
            //
          }

          //Verified Email and Email Exis
          if (!credential.user!.emailVerified) {
            //
          }

          //if user not null
          var user = credential.user;
          if (user != null) {
            //Got verified user from firebase
          } else {
            //have an error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
