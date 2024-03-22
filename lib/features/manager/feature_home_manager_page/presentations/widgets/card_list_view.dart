import 'package:ablexa/core/theming/image_manager.dart';
import 'package:ablexa/features/feature_home_manager_page/presentations/widgets/card_information.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  const CardListView({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: CardInformation(
          type: type,
          image: ImageManager.studentImage,
          name: "Shaban Salah Abdulhameed ",
        ),
      ),
    );
  }
}
