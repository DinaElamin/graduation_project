
import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/image_manager.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/students_information_widget.dart';

class StudentExamsPage extends StatefulWidget {
  const StudentExamsPage({super.key});

  @override
  State<StudentExamsPage> createState() => _StudentExamsPageState();
}

class _StudentExamsPageState extends State<StudentExamsPage> {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  Widget _buildSearchField() {
    return TextField(
      style: TextStyles.font18SemiBoldBlack,
      controller: _searchController,
      maxLines: 2,
      cursorColor: ColorsManager.grey,
      decoration: InputDecoration(
        hintText: S.of(context).search,
        border: InputBorder.none,
        hintStyle: TextStyle(
            color: ColorsManager.mainBlack.withOpacity(0.5), fontSize: 18),
      ),
      onChanged: (searchTerm) {
        // addSearchedForItemsToSearchesList(searchTerm);
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: ColorsManager.mainBlack,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearching();
          },
          icon: const Icon(
            Icons.search,
            color: ColorsManager.mainBlack,
          ),
        ),
        IconButton(
          onPressed: () {
           context.pushNamed(Routes.settingPage);
          },
          icon: const Icon(
            Icons.settings,
            color: ColorsManager.mainBlack,
          ),
        ),
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget buildAppBarTitle() {
    return Text(S.of(context).student_exams, style: TextStyles.font18SemiBoldBlack);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: ColorsManager.mainBlack,
          ),
          title: _isSearching ? _buildSearchField() : buildAppBarTitle(),
          actions: _buildAppBarActions(),
          backgroundColor: ColorsManager.mainWhite),
      body: ListView(children: [

        verticalSpacing(20),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(ImageManager.defaultImageProfile,
                          width: 50.w, height: 50.h),
                      horizontalSpacing(10),
                      Text("Shaban Salah Abdulhameed ",
                          style: TextStyles.font16SemiBoldBlack
                              .copyWith(fontSize: 14.sp)),
                    ],
                  ),
                ],
              ),
              verticalSpacing(20),
               const StudentInformationsWidget(),
            ],
          ),
        )
      ]),
    );
  }
}
