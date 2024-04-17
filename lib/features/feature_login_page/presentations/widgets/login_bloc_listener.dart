import 'package:ablexa/features/feature_login_page/data/models/login/request/login_response_model.dart';
import 'package:ablexa/features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_cubit.dart';
import 'package:ablexa/features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
class LoginBlocListener extends StatefulWidget {
  const LoginBlocListener({super.key});

  @override
  State<LoginBlocListener> createState() => _SignInBlocListenerState();
}

class _SignInBlocListenerState extends State<LoginBlocListener> {
  late LoginResponseModel loginResponseModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
      child: const SizedBox.shrink(),
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
            loading: (){
              showDialog(context: context, builder:
                  (context) => const Center(child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),),
              );
            },
            success: (loginResponse){
              loginResponseModel = loginResponse;

              context.pop();
              if(loginResponseModel.roleName! == "Manager" ) {
                context.pushNamed(Routes.homeManagerPage,arguments: loginResponseModel!.token.toString());
              } else {
                context.pushNamed(Routes.teacherHomePage);
              }
            },
            error:(error){

              setupErrorState(context, error);
            } );
      },);
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(context: context,
      builder: (context) => AlertDialog(
        content: Text(error,
          style: TextStyles.font14MediumLightBlack,
        ),
        actions: [
          TextButton(onPressed: (){
            context.pop();
          }, child: Text('Got It ',style: TextStyles.font20BoldBlack,)),
        ],
        icon: const Icon(Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),);
  }
}
