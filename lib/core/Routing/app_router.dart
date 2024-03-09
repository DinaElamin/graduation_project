
import 'package:ablexa/features/feature_change_password_page/presentations/screens/feature_change_password_page.dart';
import 'package:ablexa/features/feature_forget_password_page/presentations/screens/feature_forget_password_page.dart';
import 'package:ablexa/features/feature_landing_page/presentations/screens/feature_landing_page.dart';
import 'package:ablexa/features/feature_verify_code_page/presentations/screens/feature_verify_code_page.dart';
import 'package:flutter/material.dart';
import '../../features/feature_login_page/presentations/screens/feature_login_page.dart';
import 'routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //LandingPage
      case Routes.landingPage:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
        );
        //LoginPage
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
        //ForgetPasswordPage
      case Routes.forgetPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordPage(),
        );
        // VerifyCodePage
      case Routes.verifyCodePage:
        return MaterialPageRoute(
          builder: (context) => const VerifyCodePage(),
        );
        //change password
      case Routes.changePasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defind ${settings.name}")),
          ),
        );
    }
  }
}
