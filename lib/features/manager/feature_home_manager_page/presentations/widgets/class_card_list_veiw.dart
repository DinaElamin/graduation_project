import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/get_all_classes_model/get_all_classes_model.dart';
import '../../logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import '../../logic/cubits/get_all_classes_cubit/get_all_classes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles.dart';
class ClassCardListView extends StatefulWidget {
  const ClassCardListView({Key? key}) : super(key: key);

  @override
  State<ClassCardListView> createState() => _ClassCardListViewState();
}

class _ClassCardListViewState extends State<ClassCardListView> {
  int? selectedIndex;
@override
  void initState() {
   context.read<GetAllClassesDataCubit>().emitAllClassesStates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllClassesDataCubit,GetAllClassesDataState>(builder: (context, state) {
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
          }, success: (data) {
        final List<GetAllClassesModel> getAllClassesModel =data;
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: getAllClassesModel.length, // Example itemCount, replace with your actual data length
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      context.pushNamed(Routes.studentsPage, arguments: {
                        'className': getAllClassesModel[index].className,
                        'classId':getAllClassesModel[index].classId,
                        'subjectNameTeacher':"Math",
                        'roleName':"Manager"
                      });
                    });
                  },
                  child: Container(
                    height: 80.h,
                    padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
                    child: Container(
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorsManager.mainColor,
                      ),
                      child: ListTile(
                        title: Text(getAllClassesModel[index].className.toString(), style: TextStyles.font18SemiBoldWhite),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: ColorsManager.mainWhite),
                          onPressed: () {
                            showDialog<void>(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  // final deleteGradeGradeCubit = context
                                  //     .read<DeleteGradeCubit>();
                                  return AlertDialog(
                                    content: Text("Delete Class ?? ",style: TextStyles.font20BoldBlack,),
                                    actions: <Widget>[
                                      AppTextButton(
                                          buttonHeight: 25.r,
                                          buttonWidth: 60.r,
                                          textButton: "Delete",
                                          onPressed: () {
                                            // deleteGradeGradeCubit
                                            //     .emitDeleteGradeStates(
                                            //     token: widget.token,yearId: widget.yearId);
                                            Navigator.of(dialogContext)
                                                .pop();
                                            setState(() {
                                              context.read<GetAllClassesDataCubit>().emitAllClassesStates();
                                            });
                                          }),
                                      verticalSpacing(10),
                                      AppTextButton(
                                          buttonHeight: 25.r,
                                          buttonWidth: 60.r,
                                          textButton:
                                          S.of(context).cancel,
                                          onPressed: () {
                                            Navigator.of(dialogContext)
                                                .pop();
                                          }),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }, error: (error) {
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
    },);
  }
}
