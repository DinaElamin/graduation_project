import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/edit_student_cubit/edit_student_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/presentations/screens/student_edit_profile_page.dart';
import '../../features/feature_change_password_page/logic/cubits/change_password_cubit/change_password_cubit.dart';
import '../../features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_cubit.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_code_cubit/verify_code_cubit.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_pin_code_cubit/verify_pin_code_cubit.dart';
import '../../features/manager/feature_add_student_page/logic/cubits/add_student_cubit/add_student_cubit.dart';
import '../../features/manager/feature_get_all_student_by_id_page/logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_cubit.dart';
import '../../features/manager/feature_get_all_student_by_id_page/presentation/screens/get_all_student_by_id.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/feature_change_password_page/presentations/screens/feature_change_password_page.dart';
import '../../features/feature_change_profile_page/presentations/screens/change_profile.dart';
import '../../features/feature_forget_password_page/presentations/screens/feature_forget_password_page.dart';
import '../../features/feature_landing_page/presentations/screens/feature_landing_page.dart';
import '../../features/feature_reset_password_page/presentations/screens/reset_password.dart';
import '../../features/feature_verify_code_page/presentations/screens/feature_verify_code_page.dart';
import 'package:flutter/material.dart';
import '../../features/feature_login_page/presentations/screens/feature_login_page.dart';
import '../../features/feature_setting_page/presentations/screens/setting_page.dart';
import '../../features/feature_successfully_page/presentations/screens/feature_successfully_page.dart';
import '../../features/manager/feature_add_grade_page/presentations/screens/add_grade_page.dart';
import '../../features/manager/feature_add_student_page/presentations/screens/feature_add_student_page.dart';
import '../../features/manager/feature_add_teacher_page/logic/cubits/add_teacher_cubit/add_teacher_cubit.dart';
import '../../features/manager/feature_add_teacher_page/presentations/screens/add_teacher_page.dart';
import '../../features/manager/feature_garde_details_page/presentations/screens/grade_details_page.dart';
import '../../features/manager/feature_grades_page/presentations/screens/grades_page.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_student_cubit/get_all_student_cubit/get_all_student_cubit.dart';
import '../../features/manager/feature_home_manager_page/presentations/screens/feature_home_manager.dart';
import '../../features/manager/feature_profile_manager_page/presentations/screens/profile_manager.dart';
import '../../features/student/feature_quiz_degree_page/presentations/screens/quiz_degree.dart';
import '../../features/student/feature_student_profile_page/presentations/screens/student_profile_page.dart';
import '../../features/student/feature_students_exams_page/presentations/screens/student_exams.dart';
import '../../features/student/feature_subject_details_page/presentations/screens/subject_details.dart';
import '../../features/teacher/feature_add_exam_page/presentations/screens/add_exam_page.dart';
import '../../features/teacher/feature_profile_teacher_page/presentations/screens/profile_teacher.dart';
import '../../features/teacher/feature_quiz_update_degree_page/presentations/screens/quiz_update_degree_page.dart';
import '../../features/teacher/feature_students_page/presentations/screens/students_page.dart';
import '../../features/teacher/feature_teacher_home_page/presentations/screens/feature_teacher_home.dart';
import '../di/dependacy_injection.dart';
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
          builder: (context) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginPage()),
        );
      //ForgetPasswordPage
      case Routes.forgetPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordPage(),
        );
      // VerifyCodePage
      case Routes.verifyCodePage:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<VerifyCodeCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<VerifyPinCodeCubit>(),
            ),
          ], child: VerifyCodePage(email: email)),
        );
      //change password
      case Routes.changePasswordPage:
        final String email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<ChangePasswordCubit>(),
              child: ChangePasswordPage(email: email)),
        );
      //SuccessfullyPage
      case Routes.successfullyPage:
        return MaterialPageRoute(
          builder: (context) => const SuccessfullyPage(),
        );
      // getALlStudentById Page
      case Routes.getAllStudentByClassIdPage:
        final int classId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<GetAllStudentByClassIdCubit>(),
              child: GetAllStudentById(classId: classId)),
        );
      //home Manager Page
      case Routes.homeManagerPage:
        final String token = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<GetAllStudentDataCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<DeleteUserCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetAllTeacherDataCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<GetAllClassesDataCubit>(),
            ),
          ], child: HomeManagerPage(token: token)),
        );
      // manager profile
      case Routes.managerProfilePage:
        final String token = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => ProfileManagerPage(token: token),
        );
    // student edit profile
      case Routes.editStudentProfilePage:
        final args = settings.arguments as Map<String, dynamic>;

        final String id = args['id'];
        final String token = args['token'];
        final String image = args['image'];
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<GetAllClassesDataCubit>(),

                ),
                BlocProvider(
                  create: (context) => getIt<GetAllYearDataCubit>(),

                ),
                BlocProvider(
                  create: (context) => getIt<GetStudentByIdCubit>(),

                ),
                BlocProvider(
                  create: (context) => getIt<EditStudentCubit>(),

                ),

              ],
              child:  StudentEditProfilePage(token: token,id: id,image: image,)),
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
        final String token = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => getIt<GetAllClassesDataCubit>(),

            ),
            BlocProvider(
              create: (context) => getIt<GetAllYearDataCubit>(),

            ),
            BlocProvider(
              create: (context) => getIt<AddStudentCubit>(),
            ),
          ], child:  AddStudentPage(token: token,)),
        );
      // add teacher from manager
      case Routes.addTeacherPage:
        final String token = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetAllClassesDataCubit>(),

              ),
              BlocProvider(
                create: (context) => getIt<GetAllMaterialDataCubit>(),

              ),
              BlocProvider(
                  create: (context) => getIt<AddTeacherCubit>(),
                 ),

            ],
              child: AddTeacherPage(
                token: token,
              ),
          )
        );
      // add student from manager
      case Routes.addGradePage:
        return MaterialPageRoute(
          builder: (context) => const AddGradePage(),
        );
      // grade page
      case Routes.gradePage:
        final Map<String, String> args =
            settings.arguments as Map<String, String>;
        final String gradeName = args['gradeText']!;
        return MaterialPageRoute(
          builder: (context) => GradesPage(gradeName: gradeName),
        );
      // grade Details page
      case Routes.gradeDetailsPage:
        final String gradeName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => GradeDetailsPage(gradeName: gradeName),
        );
      // teacher home
      case Routes.teacherHomePage:
        return MaterialPageRoute(
          builder: (context) => const TeacherHome(),
        );
      // students Page
      case Routes.studentsPage:
        final String gradeName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => StudentsPage(gradeName: gradeName),
        );
      // teacher profile page
      case Routes.teacherProfilePage:
        return MaterialPageRoute(
          builder: (context) => const ProfileTeacherPage(),
        );
      // add Exam page
      case Routes.addExamPage:
        return MaterialPageRoute(
          builder: (context) => const AddExamPage(),
        );
      // change profile page
      case Routes.changeProfilePage:
        return MaterialPageRoute(
          builder: (context) => const ChangeProfile(),
        );
      // student Exams page
      case Routes.studentExamsPage:
        return MaterialPageRoute(
          builder: (context) => const StudentExamsPage(),
        );
      // student Exams page
      case Routes.quizUpdatedDegreePage:
        final String quizName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => QuizUpdateDegreePage(quizName: quizName),
        );
      // student Exams page
      case Routes.quizDegreePage:
        final String quizName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => QuizDegree(quizName: quizName),
        );
      // subject details page
      case Routes.subjectDetailsPage:
        final String subjectName = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => SubjectDetailsPage(subjectName: subjectName));
      // student Exams page
      case Routes.resetPasswordPage:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
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
