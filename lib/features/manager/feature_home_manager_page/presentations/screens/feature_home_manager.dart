import 'package:ablexa/core/theming/image_manager.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/helper/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/users_widget.dart';

class HomeManagerPage extends StatefulWidget {
  const HomeManagerPage({Key? key, required this.token, required this.imageManager, required this.nameManager, required this.emailManager, required this.nationalId}) : super(key: key);
final String token,imageManager,nameManager,emailManager,nationalId;
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
              Container(
                decoration: BoxDecoration(color: ColorsManager.mainColor),
                child: Row(

                  children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.asset(ImageManager.logoApp,height: 50.sp,width: 50.sp),
                   ),
                    horizontalSpacing(50.sp),
                    Center(child: Text("Home Page",style: TextStyles.font20BoldWhite,)),
                    horizontalSpacing(90.sp),
                    PopupMenuButton<String>(
                      offset: const Offset(0, 40), // Offset to position menu under the icon
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          onTap: () {
                            context.pushNamed(Routes.managerProfilePage,arguments: {
                              'token':widget.token,
                              'nameManager':widget.nameManager,
                              'emailManager':widget.emailManager,
                              'nationalId':widget.nationalId,
                              'imageManager':widget.imageManager
                            });
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
                      icon:  Image.asset(ImageManager.settingWhite), // Use Flutter's built-in Icon widget
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // Set border radius to 16
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(20),
               UsersWidget(token: widget.token),

            ],
          ),
        ),
      ),
    );
  }
}
