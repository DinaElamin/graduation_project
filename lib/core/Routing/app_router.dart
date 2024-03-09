
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/dependacy_injection.dart';
import 'routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SplashScreen(),
      //   );
      // case Routes.onBoardingScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const OnBoardingScreen(),
      //   );
      // case Routes.addReportScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const AddReportScreen(),
      //   );
      // case Routes.addDiagnosisScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const AddDiagnosisScreen(),
      //   );
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //         create: (context) => getIt<SignUpCubit>(),
      //         child: const SignUpScreen()),
      //   );
      // case Routes.signInScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => BlocProvider(
      //         create: (context) => getIt<SignInCubit>(),
      //         child: const SignInScreen()),
      //   );
      // case Routes.resetPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ResetPasswordScreen(),
      //   );
      // case Routes.diagnosisPatientConditionScreen:
      //
      // final name = settings.arguments as String;
      //   final image = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) =>  DiagnosisPatientConditionScreen(name: name,image: image,),
      //   );
      // case Routes.createNewPassword:
      //   return MaterialPageRoute(
      //     builder: (context) => const CreateNewPasswordScreen(),
      //   );
      // case Routes.buttomNavigationPatient:
      //   return MaterialPageRoute(
      //     builder: (context) => ButtonNavigationPatient(),
      //   );
      // case Routes.verificationScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const VerificationScreen(
      //       phoneNumber: '01026267450',
      //     ),
      //   );
      // case Routes.reportsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ReportsScreen(),
      //   );
      // case Routes.reportsDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ReportsDetailsScreen(),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const HomePatientScreen(),
      //   );
      // case Routes.editProfileScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const EditProfileScreen(),
      //   );
      // case Routes.doctorDetailsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const DoctorDetailsScreen(),
      //   );
      // case Routes.buttomNavigationDoctor:
      //   final token = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) => ButtonNavigationDoctor(
      //       token: token,
      //     ),
      //   );
      // case Routes.myConsultationScreen:
      //   final token = settings.arguments as String;
      //   return MaterialPageRoute(
      //     builder: (context) =>  MyConsultationsScreen(
      //       token: token,
      //     ),
      //   );
      // case Routes.profileScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProfileScreen(),
      //   );
      // case Routes.myFavoriteDoctorScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => MultiBlocProvider(
      //       providers: [
      //         BlocProvider(create: (context) => getIt<DoctorCubit>()),
      //         // Add more BlocProviders if needed
      //       ],
      //       child: const MyFavoriteDoctorScreen(),
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text("No route defind ${settings.name}")),
          ),
        );
    }
  }
}
