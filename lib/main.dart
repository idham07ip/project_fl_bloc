import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_fl_bloc/common/routes/routes.dart';
import 'package:project_fl_bloc/common/values/colors.dart';
import 'package:project_fl_bloc/global.dart';
import 'package:project_fl_bloc/pages/bloc_provider.dart';

Future<void> main() async {
  await Global.init();

  // WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: ScreenUtilInit(
        //
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,

          //REMOVE_LINES
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),

          //
          //const WelcomePage(),
          //home: const ApplicationPage(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // routes: {
          //   // "myHomePage": (context) => const MyHomePage(),
          //   "signIn": (context) => const SignIn(),
          //   "register": (context) => const Register(),
          // },
        ),
      ),
    );
  }
}
