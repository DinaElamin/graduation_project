import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_student_cubit/login_cubit/get_all_student_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_student_cubit/login_cubit/get_all_student_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../data/models/get_all_student_model/get_all_student_model.dart';
import 'card_information.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({super.key});

  @override
  State<StudentsListView> createState() => _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {
  @override
  void initState() {
    context.read<GetAllStudentDataCubit>().emitAllStudentStates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetAllStudentDataCubit,GetAllStudentDataState>(
      builder: (context, state) {
        return state.when(
          initial:  (){
            return const Center(child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),);
          },
          loading: (){
            return const Center(child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),);
          },
          success: (data) {
            final List<GetAllStudentModel> getAllStudentModel= data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: getAllStudentModel.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  CardInformation(
                    type: "Student",
                    image: getAllStudentModel[index].image!,
                    name:getAllStudentModel[index].name.toString(),
                  )
              ),
            );
          },
          error:(error) {
            return AlertDialog(
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
            );
          },);
      },

    );
  }
}
