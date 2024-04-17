import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../data/models/get_all_teacher_model/get_all_teacher_model.dart';
import '../../logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import '../../logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_state.dart';
import 'card_information.dart';

class TeachersListView extends StatefulWidget {
  const TeachersListView({super.key});

  @override
  State<TeachersListView> createState() => _TeachersListViewState();
}

class _TeachersListViewState extends State<TeachersListView> {
  @override
  void initState() {
    context.read<GetAllTeacherDataCubit>().emitAllTeacherStates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetAllTeacherDataCubit,GetAllTeacherDataState>(
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
            final List<GetAllTeacherModel> getAllTeacherModel = data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: getAllTeacherModel.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  CardInformation(
                    type: "Teacher",
                    image: getAllTeacherModel[index].image!,
                    name:getAllTeacherModel[index].name.toString(),
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
