import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/users_widget.dart';

class HomeManagerPage extends StatefulWidget {
  const HomeManagerPage({Key? key}) : super(key: key);

  @override
  State<HomeManagerPage> createState() => _HomeManagerPageState();
}

class _HomeManagerPageState extends State<HomeManagerPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this); // Updated length to 4
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.grey, // Set scaffold background color to white
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpacing(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w), // Updated padding
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        contentPadding: const EdgeInsets.all(0),
                        fillColorFromBackground: ColorsManager.mainWhite,
                        borderRadius: 16.sp,
                        prefixIcon: const Icon(Icons.search),
                        hintText: S.of(context).search,
                        validator: (value) {
                          // Your validation logic here
                          return null; // Return null for valid input
                        },
                      ),
                    ),
                    horizontalSpacing(20),
                    PopupMenuButton<String>(
                      offset: const Offset(0, 40), // Offset to position menu under the icon
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          onTap: () {
                            context.pushNamed(Routes.managerProfilePage);
                          },
                          value: 'my_profile',
                          child: SizedBox(
                            width: 100.w,
                            child: Row(
                              children: [
                                const Icon(Icons.person_outline_sharp),
                                horizontalSpacing(5),
                                Text(S.of(context).my_profile, style: TextStyles.font12BlackBold),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            context.pushNamed(Routes.settingPage);
                          },
                          value: 'settings',
                          child: SizedBox(
                            width: 100.w,
                              child: Row(children: [
                                const Icon(Icons.settings),
                                horizontalSpacing(5),
                                 Text(S.of(context).setting, style: TextStyles.font12BlackBold),
                              ],)
                          ),
                        ),
                      ],
                      onSelected: (String value) {
                        if (value == 'my_profile') {
                          // Handle My Profile action
                          print('My Profile selected');
                        } else if (value == 'settings') {
                          // Handle Settings action
                          print('Settings selected');
                        }
                      },
                      icon: const Icon(Icons.settings), // Use Flutter's built-in Icon widget
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Set border radius to 16
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(20),
              const UsersWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
