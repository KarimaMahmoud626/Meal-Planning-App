import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 25,
      width: SizeConfig.defaultSize! * 28,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Positioned.fill(
              child: RoundedRectangleImageContainer(
                image: 'assets/images/green apple.jpeg',
                border: false,
              ),
            ),

            Positioned(
              bottom: SizeConfig.defaultSize! * 0.75,
              left: SizeConfig.defaultSize! * 2,
              right: SizeConfig.defaultSize! * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: SizeConfig.defaultSize! * 5,
                    width: SizeConfig.defaultSize! * 15,
                    child: CustomGeneralButton(
                      text: 'Add to Cart',
                      onTap: () {},
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.favorite,
                    iconSize: 28,
                    iconColor: Colors.red,
                    buttonColor: Colors.transparent,
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
