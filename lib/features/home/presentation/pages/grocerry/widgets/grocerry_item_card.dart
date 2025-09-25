import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/favourite_icon_button.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/rounded_rectangle_image_container.dart';

class GrocerryItemCard extends StatelessWidget {
  const GrocerryItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: SizedBox(
        height: SizeConfig.defaultSize! * 22,
        width: SizeConfig.defaultSize! * 20,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  RoundedRectangleImageContainer(
                    image: 'assets/images/green apple.jpeg',
                  ),
                  Positioned(
                    bottom: SizeConfig.defaultSize! * 7.5,
                    right: SizeConfig.defaultSize! * 0.5,
                    child: FavouriteIconButton(),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: SizeConfig.defaultSize! * 8,
                child: Stack(
                  children: [
                    CustomTitleSubtitle(
                      title: 'Green Apple',
                      titleColor: Color(0xFF000000),
                      subTitle: '\$1',
                      subTitleColor: kMainColor,
                    ),
                    Positioned(
                      bottom: SizeConfig.defaultSize! * 0.5,
                      right: SizeConfig.defaultSize! * 0.5,
                      child: CustomIconButton(
                        icon: Icons.add,
                        iconColor: Color(0xFFFFFFFF),
                        buttonColor: kMainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
