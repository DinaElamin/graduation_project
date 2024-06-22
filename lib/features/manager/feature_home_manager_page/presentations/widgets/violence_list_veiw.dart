import '../../../../../core/helper/extentions.dart';
import '../../data/models/get_violence_model/get_violence_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/cubits/get_violence_cubit/get_violence_cubit.dart';
import '../../logic/cubits/get_violence_cubit/get_violence_state.dart';
class ViolenceListView extends StatefulWidget {
  const ViolenceListView({Key? key}) : super(key: key);

  @override
  State<ViolenceListView> createState() => _ViolenceListViewState();
}

class _ViolenceListViewState extends State<ViolenceListView> {
  int? selectedIndex;
@override
  void initState() {
   context.read<GetViolenceCubit>().emitViolenceStates();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetViolenceCubit,GetViolenceDataState>(builder: (context, state) {
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
             final List<GetViolenceModel> getviolenceModel =data;
             return ListView.builder(
                  itemCount:getviolenceModel.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.grey,
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Container(
                            height: 40.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.sp),
                            color: ColorsManager.lighterRedColor),
                            child: Center(
                            child: Text(
                            getviolenceModel[index].classname.toString() 
                            ,
                            style: TextStyles.font15MediumDarkred,
                           )),
                           ),
                           Text(
                           getviolenceModel[index].classname.toString() ,
                           style: TextStyles.font20BoldBlack.copyWith(fontSize: 15.sp),
                           ),
      
                           ]),
                       )
                      ), 
                    ),
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
