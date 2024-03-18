
import 'package:ablexa/features/feature_add_grade_page/presentations/screens/add_grade_page.dart';
import 'package:ablexa/features/feature_add_student_page/presentations/screens/feature_add_student_page.dart';
import 'package:ablexa/features/feature_add_teacher_page/presentations/screens/add_teacher_page.dart';
import 'package:ablexa/features/feature_change_password_page/presentations/screens/feature_change_password_page.dart';
import 'package:ablexa/features/feature_forget_password_page/presentations/screens/feature_forget_password_page.dart';
import 'package:ablexa/features/feature_grades_page/presentations/screens/grades_page.dart';
import 'package:ablexa/features/feature_home_manager_page/presentations/screens/feature_home_manager.dart';
import 'package:ablexa/features/feature_landing_page/presentations/screens/feature_landing_page.dart';
import 'package:ablexa/features/feature_student_profile_page/presentations/screens/student_profile_page.dart';
import 'package:ablexa/features/feature_verify_code_page/presentations/screens/feature_verify_code_page.dart';
import 'package:flutter/material.dart';
import '../../features/feature_login_page/presentations/screens/feature_login_page.dart';
import '../../features/feature_profile_manager_page/presentations/screens/profile_manager.dart';
import '../../features/feature_setting_page/presentations/screens/setting_page.dart';
import '../../features/feature_successfully_page/presentations/screens/feature_successfully_page.dart';
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
        //SuccessfullyPage
      case Routes.successfullyPage:
        return MaterialPageRoute(
          builder: (context) => const SuccessfullyPage(),
        );
    //home Manager Page
      case Routes.homeManagerPage:
        return MaterialPageRoute(
          builder: (context) => const HomeManagerPage(),
        );
    // manager profile
      case Routes.managerProfilePage:
        return MaterialPageRoute(
          builder: (context) => const ProfileManagerPage(),
        );
    // student profile
      case Routes.studentProfilePage:
        return MaterialPageRoute(
          builder: (context) => const StudentProfilePage(),
        );
    // student profile
      case Routes.settingPage:
        return MaterialPageRoute(
          builder: (context) => const SettingPage(),
        );
    // add student from manager
      case Routes.addStudentPage:
        return MaterialPageRoute(
          builder: (context) => const AddStudentPage(),
        );
    // add teacher from manager
      case Routes.addTeacherPage:
        return MaterialPageRoute(
          builder: (context) => const AddTeacherPage(),
        );
    // add student from manager
      case Routes.addGradePage:
        return MaterialPageRoute(
          builder: (context) => const AddGradePage(),
        );
    // grade page
      case Routes.gradePage:
        return MaterialPageRoute(
          builder: (context) => const GradesPage(),
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
