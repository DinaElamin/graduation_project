import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/features/feature_setting_page/presentations/screens/setting_page.dart';
import 'package:ablexa/features/manager/feature_profile_manager_page/presentations/screens/profile_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

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
  const HomeManagerPage(
      {Key? key,
      required this.token,
      required this.imageManager,
      required this.nameManager,
      required this.emailManager,
      required this.nationalNumber})
      : super(key: key);
  final String token, imageManager, nameManager, emailManager, nationalNumber;
  @override
  State<HomeManagerPage> createState() => _HomeManagerPageState();
}

class _HomeManagerPageState extends State<HomeManagerPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 5, vsync: this); // Updated length to 4
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            ColorsManager.grey, // Set scaffold background color to white
        body: IndexedStack(index: _currentIndex, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: ColorsManager.mainColor),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/photo_2024-06-22_14-08-36.jpg'),
                                fit: BoxFit.fill,
                              ),
                            )),
                        // child: Image.asset(
                        //   "assets/images/photo_2024-06-22_14-08-36.jpg",
                        //   height: 50.sp,
                        //   width: 50.sp,
                        // ),
                      ),
                      horizontalSpacing(50.sp),
                      Center(
                          child: Text(
                        "Home Page",
                        style: TextStyles.font20BoldWhite,
                      )),
                      horizontalSpacing(90.sp),
                      PopupMenuButton<String>(
                        offset: const Offset(
                            0, 40), // Offset to position menu under the icon
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            onTap: () {
                              context.pushNamed(Routes.managerProfilePage,
                                  arguments: {
                                    'token': widget.token,
                                    'nameManager': widget.nameManager,
                                    'emailManager': widget.emailManager,
                                    'nationalNumber': widget.nationalNumber,
                                    'imageManager': widget.imageManager
                                  });
                            },
                            value: 'my_profile',
                            child: SizedBox(
                              width: 100.w,
                              child: Row(
                                children: [
                                  const Icon(Icons.person_outline_sharp),
                                  horizontalSpacing(5),
                                  Text(S.of(context).my_profile,
                                      style: TextStyles.font12BlackBold),
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
                                child: Row(
                                  children: [
                                    const Icon(Icons.settings),
                                    horizontalSpacing(5),
                                    Text(S.of(context).setting,
                                        style: TextStyles.font12BlackBold),
                                  ],
                                )),
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
                        icon: Image.asset(ImageManager
                            .settingWhite), // Use Flutter's built-in Icon widget
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              16), // Set border radius to 16
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
          ProfileManagerPage(
            token: widget.token,
            nameManager: widget.nameManager,
            emailManager: widget.emailManager,
            nationalId: widget.nationalNumber,
            imageManager: widget.imageManager,
          ),
          SettingPage()
        ]),
        bottomNavigationBar: CurvedNavigationBar(
          color: Color(0xff6C63FF),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Color(0xff6C63FF),
          animationDuration: Duration(milliseconds: 500),
          index: _currentIndex,
          items: const <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
            Icon(Icons.settings, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
