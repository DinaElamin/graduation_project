import '../helper/extentions.dart';
import 'package:flutter/material.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.text, this.widgetActions,
  });
  final String text;
  final Widget?  widgetActions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
       widgetActions ?? Container(),
      ],
      title: Text(text),
      backgroundColor: ColorsManager.mainWhite,
      titleTextStyle: TextStyles.font18Black500,
      foregroundColor: ColorsManager.mainBlack,
      shadowColor: ColorsManager.mainBlack.withOpacity(0.2),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: ColorsManager.mainBlack.withOpacity(0.5),
      ),
    );
  }
}
