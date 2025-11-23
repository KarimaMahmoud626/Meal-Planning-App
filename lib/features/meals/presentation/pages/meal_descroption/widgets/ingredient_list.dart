import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/meals/data/models/ingredient_model.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({super.key, required this.ingredients});

  final List<IngredientModel> ingredients;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.2,
      width: SizeConfig.screenWidth,
      child: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '- ${ingredients[index].ingredientName}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    '- ${ingredients[index].ingredientMeasure}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
