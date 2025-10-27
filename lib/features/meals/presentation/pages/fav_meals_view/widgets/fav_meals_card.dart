import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/features/meals/domain/models/fav_meal_model.dart';

class FavMealsCard extends StatelessWidget {
  const FavMealsCard({super.key, required this.item, this.onPressed});

  final FavMealModel item;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 28,
      width: SizeConfig.defaultSize! * 20,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                RoundedRectangleNetworkImageContainer(
                  image: item.mealImageUrl,
                  height: 19.5,
                  width: 20,
                  isBordered: false,
                  isPadded: false,
                ),
                Positioned(
                  top: SizeConfig.defaultSize! * 0.5,
                  right: SizeConfig.defaultSize! * 0.5,
                  child: CustomIconButton(
                    icon: Icons.favorite,
                    iconSize: 28,
                    iconColor: Colors.red,
                    buttonColor: Colors.transparent,
                    onPressed: onPressed,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: SizeConfig.defaultSize! * 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item.mealName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
