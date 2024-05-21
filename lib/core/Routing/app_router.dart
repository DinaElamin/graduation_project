import 'package:ablexa/features/manager/feature_add_grade_page/logic/cubits/add_year_cubit/add_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/presentations/screens/edit_profile_teacher.dart';
import 'package:ablexa/features/manager/feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/edit_student_cubit/edit_student_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/presentations/screens/student_edit_profile_page.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/logic/cubits/add_exam_cubit/add_exam_cubit.dart';
import '../../features/feature_change_password_page/logic/cubits/change_password_cubit/change_password_cubit.dart';
import '../../features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_cubit.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_code_cubit/verify_code_cubit.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_pin_code_cubit/verify_pin_code_cubit.dart';
import '../../features/manager/feature_add_student_page/logic/cubits/add_student_cubit/add_student_cubit.dart';
import '../../features/manager/feature_garde_details_page/logic/cubits/add_class_cubit/add_class_cubit.dart';
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
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String emailManager = args['emailManager'];
        final String nameManager = args['nameManager'];
        final String phoneNumberManager = args['phoneNumberManager'];
        final String imageManager = args['imageManager'];
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
              providers: [
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
                BlocProvider(
                  create: (context) => getIt<GetStudentByIdCubit>(),
                ),
              ],
              child: HomeManagerPage(
                token: token,
                emailManager: emailManager,
                imageManager: imageManager,
                nameManager: nameManager,
                nationalNumber: phoneNumberManager,
              )),
        );
      // manager profile
      case Routes.managerProfilePage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String emailManager = args['emailManager'];
        final String nameManager = args['nameManager'];
        final String nationalNumber = args['nationalNumber'];
        final String imageManager = args['imageManager'];

        return MaterialPageRoute(
          builder: (context) => ProfileManagerPage(
            token: token,
            emailManager: emailManager,
            imageManager: imageManager,
            nameManager: nameManager,
            nationalId: nationalNumber,
          ),
        );
      // student edit profile
      case Routes.editStudentProfilePage:
        final args = settings.arguments as Map<String, dynamic>;

        final String id = args['id'];
        final String token = args['token'];
        final String image = args['image'];
        final String name = args['name'];
        final int yearId = args['yearId'];
        final String nationalNumber = args['nationalNumber'];
        final int classId = args['classId'];
        final String email = args['email'];
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
              child: StudentEditProfilePage(
                classId: classId,
                email: email,
                nationalId: nationalNumber,
                name: name,
                yearId: yearId,
                token: token,
                id: id,
                image: image,
              )),
        );
      // student profile
      case Routes.studentProfilePage:
        final args = settings.arguments as Map<String, dynamic>;
        final String imageStudent = args['imageStudent'];
        final String nameStudent = args['nameStudent'];
        final String emailStudent = args['emailStudent'];
        final String nationalIdStudent = args['nationalIdStudent'];
        final int classId = args['classId'];
        return MaterialPageRoute(
          builder: (context) => StudentProfilePage(
            nationalIdStudent: nationalIdStudent,
            classId: classId,
            emailStudent: emailStudent,
            nameStudent: nameStudent,
            imageStudent: imageStudent,
          ),
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
          builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<GetAllClassesDataCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<GetAllYearDataCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<AddStudentCubit>(),
                ),
              ],
              child: AddStudentPage(
                token: token,
              )),
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
                ));
      // add student from manager
      case Routes.addGradePage:
        final String token = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AddYearCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<GetAllMaterialDataCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<DeleteGradeCubit>(),
              ),
            ],
            child: AddGradePage(
              token: token,
            ),
          ),
        );
      // grade page
      case Routes.gradesPage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<GetAllYearDataCubit>(),
                ),
              ],
              child: GradesPage(
                token: token,
              )),
        );
      // grade Details page
      case Routes.gradeDetailsPage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String gradeName = args['gradeName'];
        final int materialid = args['materialid'];

        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<GetAllMaterialDataCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<AddClassCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<DeleteGradeCubit>(),
                ),
              ],
              child: GradeDetailsPage(
                  token: token,
                  materialid: materialid,
                  gradeName: gradeName)),
        );
      // teacher home
      case Routes.teacherHomePage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String imageTeacher = args['imageTeacher'];
        final String nameTeacher = args['nameTeacher'];
        final String emailTeacher = args['emailTeacher'];
        final String nationalNumber = args['nationalNumber'];
        final String TeacherId = args['TeacherId'];

        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetAllClassesDataCubit>(),
              ),
            ],
            child: TeacherHome(
              TeacherId: TeacherId,
              nationalNumber: nationalNumber,
              token: token,
              nameTeacher: nameTeacher,
              emailTeacher: emailTeacher,
              imageTeacher: imageTeacher,
            ),
          ),
        );
      // students Page
      case Routes.studentsPage:
        final args = settings.arguments as Map<String, dynamic>;
        final String className = args['className'];
        final int classId = args['classId'];
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetAllStudentByClassIdCubit>(),
              ),
            ],
            child: StudentsPage(
              classId: classId,
              className: className,
            ),
          ),
        );
      // teacher profile page
      case Routes.editTeacherProfilePage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String TeacherId = args['TeacherId'];
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
                create: (context) => getIt<EditTeacherCubit>(),
              ),
            ],
            child: EditTeacherProfilePage(
              token: token,
              userId: TeacherId,
            ),
          ),
        );
      // teacher profile page
      case Routes.teacherProfilePage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String imageTeacher = args['imageTeacher'];
        final String nameTeacher = args['nameTeacher'];
        final String emailTeacher = args['emailTeacher'];
        final String nationalNumber = args['nationalNumber'];
        final String TeacherId = args['TeacherId'];
        return MaterialPageRoute(
          builder: (context) => ProfileTeacherPage(
            teacherId: TeacherId,
            token: token,
            nationalNumber: nationalNumber,
            nameTeacher: nameTeacher,
            emailTeacher: emailTeacher,
            imageTeacher: imageTeacher,
          ),
        );
      // add Exam page
      case Routes.addExamPage:
        final args = settings.arguments as Map<String, dynamic>;
        final String token = args['token'];
        final String teacherId = args['TeacherId'];
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => getIt<AddExamCubit>(),
              child: AddExamPage(
                TeacherId: teacherId,
                token: token,
              )),
        );
      // change profile page
      case Routes.changeProfilePage:
        return MaterialPageRoute(
          builder: (context) => const ChangeProfile(),
        );
      // student Exams page
      case Routes.studentExamsPage:
        final args = settings.arguments as Map<String, dynamic>;
        final String imageStudent = args['imageStudent'];
        final String nameStudent = args['nameStudent'];
        final String emailStudent = args['emailStudent'];
        final String nationalIdStudent = args['nationalIdStudent'];
        final int classId = args['classId'];
        return MaterialPageRoute(
          builder: (context) => StudentExamsPage(
            classId: classId,
            nationalIdStudent: nationalIdStudent,
            imageStudent: imageStudent,
            nameStudent: nameStudent,
            emailStudent: emailStudent,
          ),
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
