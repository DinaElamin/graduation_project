import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/core/theming/media_query_helper.dart';
import 'package:flutter/material.dart';
import '../widgets/text_and_button_widget.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainWhite,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: context.screenHeight*0.6,
                  child: Image.asset(ImageManager.featuresLandingScreen)),
              const TextAndButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
