import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/features/meals/domain/models/meal_model.dart';

class SuggestedMealCard extends StatelessWidget {
  const SuggestedMealCard({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 20,
      width: SizeConfig.defaultSize! * 25,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                RoundedRectangleNetworkImageContainer(
                  height: 13,
                  width: 22,
                  image: meal.mealImageUrl,
                ),
                Positioned(
                  bottom: 5,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Show Recipe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: SizeConfig.defaultSize! * 8.5,
                //   left: SizeConfig.defaultSize! * 18,
                //   child: FavouriteIconButton(
                //     isInitiallyLiked: false,
                //     itemId: '',
                //   ),
                // ),
              ],
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  meal.mealName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
