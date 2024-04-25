import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
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
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: getAllClassesModel.length, // Example itemCount, replace with your actual data length
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Update the selected index
                      selectedIndex = index;
                      context.pushNamed(Routes.getAllStudentByClassIdPage,arguments: getAllClassesModel[index].classId);
                    });
                  },
                  child: Container(
                    height: 100.h,
                    padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 10.h),
                    child: Card(

                      color: selectedIndex == index ? ColorsManager.mainColor : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.sp), // Set border radius to 20
                      ),
                      child: ListTile(
                        title: Text(getAllClassesModel[index].className.toString(), style: TextStyles.font20BoldBlack),
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
