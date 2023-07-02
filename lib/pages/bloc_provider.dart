import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/pages/bloc/app_blocs.dart';
// import 'package:project_fl_bloc/app_blocs.dart';
import 'package:project_fl_bloc/pages/register/bloc/register_blocs.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        // BlocProvider(create: (context) => AppBlocs()),

        //SignIn Bloc
        BlocProvider(create: (context) => SignInBloc()),

        //Register Bloc
        BlocProvider(create: (context) => RegisterBlocs()),

        //Application Bloc
        BlocProvider(create: (context) => AppBlocs()),
      ];
}
