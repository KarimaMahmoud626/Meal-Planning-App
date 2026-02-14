import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/meal_description_view.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 17,
      width: SizeConfig.defaultSize! * 30,
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  RoundedRectangleNetworkImageContainer(
                    height: 16,
                    image: meal.mealImageUrl,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTitleSubtitle(
                        title: meal.mealName,
                        subTitle: meal.mealArea,
                        titleColor: Colors.black,
                        subTitleColor: kMainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: SizeConfig.defaultSize!,
            right: SizeConfig.defaultSize!,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kMainColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Get.to(
                  () => MealDescriptionView(meal: meal),
                  duration: const Duration(milliseconds: 500),
                  transition: getx.Transition.rightToLeft,
                );
              },
              child: const Text(
                'Show Recipe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
