import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/meal_info_model.dart';

class PlanMealSubCard extends StatelessWidget {
  const PlanMealSubCard({super.key, this.filled = true, this.meal});

  final bool filled;
  final MealInfoModel? meal;

  @override
  Widget build(BuildContext context) {
    final mealImage = 'https://spoonacular.com/recipeImages/${meal!.mealImage}';
    return Card(
      elevation: 4,
      color: kMainColor.withOpacity(0.65),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child:
          filled
              ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      height: SizeConfig.defaultSize! * 5,
                      child: Text(
                        meal!.mealTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  RoundedRectangleNetworkImageContainer(
                    image: mealImage,
                    isBordered: false,
                    isPadded: false,
                    height: 10,
                    width: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: SizeConfig.defaultSize! * 4,
                        width: SizeConfig.defaultSize! * 10,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Show Recipe',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          '${meal!.readyMin}min',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              )
              : Center(
                child: CustomIconButton(
                  icon: Icons.add,
                  buttonColor: kMainColor,
                  iconColor: Colors.white,
                  iconSize: 32,
                  height: 36,
                  width: 36,
                ),
              ),
    );
  }
}
