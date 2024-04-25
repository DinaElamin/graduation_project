import '../../../../../core/helper/extentions.dart';
import '../../data/model/get_all_student_by_id_model/get_all_student_by_id_model.dart';
import '../../logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_cubit.dart';
import '../../logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import 'card_information.dart';

class GetAllStudentByIdListView extends StatefulWidget {
  const GetAllStudentByIdListView({super.key, required this.classId});
 final int classId;
  @override
  State<GetAllStudentByIdListView> createState() => _GetAllStudentByIdState();
}

class _GetAllStudentByIdState extends State<GetAllStudentByIdListView> {
  @override
  void initState() {
    context.read<GetAllStudentByClassIdCubit>().emitAllStudentsByClassId(classId: widget.classId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetAllStudentByClassIdCubit,GetAllStudentsByClassIdState>(
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
            final List<GetAllStudentsByClassIdModel> getAllStudentsByIdModel= data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: getAllStudentsByIdModel.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:  CardInformation(
                    type: "Student",
                    image: "file:///Images/${getAllStudentsByIdModel[index].image!.toString()}",
                    name:getAllStudentsByIdModel[index].name.toString(),
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
