import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meals/domain/models/meal_model.dart';

class NutritionRequestModel extends Equatable {
  // final String apiKey;
  final String title;
  final num? servings;
  final String instructions;
  final List<String> ingredients;

  const NutritionRequestModel({
    required this.title,
    this.servings = 1,
    required this.instructions,
    required this.ingredients,
  });

  toJson() {
    return {
      kTitle: title,
      kServings: servings,
      kInngredients: ingredients,
      kInstructions: instructions,
    };
  }

  factory NutritionRequestModel.fromMealModel(MealModel meal) {
    final mealIngredients =
        meal.mealIngredients
            ?.map((i) => '${i.ingredientMeasure} ${i.ingredientName}')
            .toList();
    return NutritionRequestModel(
      title: meal.mealName,
      servings: 1,
      ingredients: mealIngredients!,
      instructions: meal.mealRecipe!,
      // apiKey: '16b0bd59b36a41ab8ee6762f01eabb41',
    );
  }

  @override
  List<Object?> get props => [title, servings, instructions, ingredients];
}
