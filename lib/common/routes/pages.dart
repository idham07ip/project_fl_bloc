//unify BlocProvider and Routes and Pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/common/routes/names.dart';
import 'package:project_fl_bloc/global.dart';
import 'package:project_fl_bloc/pages/application/application_page.dart';
import 'package:project_fl_bloc/pages/bloc/app_blocs.dart';
import 'package:project_fl_bloc/pages/register/bloc/register_blocs.dart';
import 'package:project_fl_bloc/pages/register/register.dart';
import 'package:project_fl_bloc/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:project_fl_bloc/pages/sign_in/sign_in.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_blocs.dart';
import 'package:project_fl_bloc/pages/welcome/welcome.dart';

class AppPages {
  //Member of class instances
  static List<PageEntity> routesFunc() {
    return [
      //OnboardingPage
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const WelcomePage(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),

      //SignInPage
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),

      //RegisterPage
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),

      //ApplicationPage or HomePage
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
    ];
  }

//static function/ Return all the bloc Providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var blocForLoop in routesFunc()) {
      blocProviders.add(blocForLoop.bloc);
    }
    return blocProviders;
  }

  //Generate the Routes / A model that covers entire screen as we click on Navigator object.
  //a modal that covers entire screen as click on navigator object.
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    //Check for route name matching when navigator gets triggered
    if (settings.name != null) {
      var result =
          routesFunc().where((element) => element.route == settings.name);

      //Check Valid or Invalid Routes
      if (result.isNotEmpty) {
        print("First log");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          print("second log");

          //retrieve the user token
          bool isUserLoggedIn = Global.storageService.getIsLoggedIn();
          if (isUserLoggedIn) {
            //if user logged in go to ApplicationPage
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          //if user not login go to SignIn
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }

        //if user never login go to onBoardingPage
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("Invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

//unify routes and pages and BlocProvider
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  //create constructor optional named parameter
  PageEntity({required this.route, required this.page, this.bloc});
}
