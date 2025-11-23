import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/ingredient_list.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/meal_image_container.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/nutrition_sumary.dart';

class MealDescriptionViewBodyContent extends StatelessWidget {
  const MealDescriptionViewBodyContent({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MealImageContainer(meal: meal),
          VerticalSpace(1),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'NUTRITION SUMMARY',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          NutritionSumary(meal: meal),
          VerticalSpace(1),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '🍅 INGREDIENTS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          IngredientList(ingredients: meal.mealIngredients!),
          VerticalSpace(1),
          CustomTitleSubtitle(
            title: '👩‍🍳 RECIPE INSTRUCTIONS',
            titleFontSize: 20,
            subTitle: meal.mealRecipe,
            subTitleFontSize: 15,
          ),
        ],
      ),
    );
  }
}
