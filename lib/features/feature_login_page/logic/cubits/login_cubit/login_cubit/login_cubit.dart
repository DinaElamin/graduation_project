import 'package:ablexa/features/feature_login_page/data/repos/login_repo/login_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/login/request/login_request_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginInStates() async {
    emit(const LoginState.loading());
    final response = await loginRepo.login(LoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.when(
      success: (loginResponse) {
        // _saveToken(loginResponse.token!);
        // _savePatientOrDoctor(loginResponse.roleName!);
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
  // Future<void> _saveToken(String token) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(ApiConstant.keyAccessToken, token);
  // }
  //
  // Future<void> _savePatientOrDoctor(String patientOrDoctor) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(ApiConstant.patientOrDoctor, patientOrDoctor);
  // }
  //
  // void removeToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove(ApiConstant.keyAccessToken);
  //   emit(const SignInState.error(error: 'Unauthorized'));
   //}
}
