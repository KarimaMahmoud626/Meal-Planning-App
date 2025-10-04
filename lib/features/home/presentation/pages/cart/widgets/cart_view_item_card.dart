import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/rounded_rectangle_image_container.dart';

class CartViewItemCard extends StatelessWidget {
  const CartViewItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 17,
      width: SizeConfig.defaultSize! * 30,
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  RoundedRectangleImageContainer(
                    height: 16,
                    image: 'assets/images/green apple.jpeg',
                  ),
                  CustomTitleSubtitle(title: 'Item Name', subTitle: 'price'),
                ],
              ),
            ),
            Positioned(
              bottom: SizeConfig.defaultSize! * 0.5,
              right: SizeConfig.defaultSize! * 0.5,
              child: Row(
                spacing: 8,
                children: [
                  CustomIconButton(
                    icon: Icons.add,
                    iconColor: Color(0xFFFFFFFF),
                    buttonColor: kMainColor,
                  ),
                  Text('1'),
                  CustomIconButton(
                    icon: Icons.remove,
                    iconColor: Color(0xFFFFFFFF),
                    buttonColor: kMainColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
