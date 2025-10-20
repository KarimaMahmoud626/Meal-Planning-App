import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meals/domain/models/ingredient_model.dart';

class MealModel extends Equatable {
  final String mealName;
  final String mealId;
  final String mealArea;
  final String mealRecipe;
  final String mealImageUrl;
  final String mealVideoUrl;
  final String mealCategory;
  final List<IngredientModel> mealIngredients;

  const MealModel({
    required this.mealCategory,
    required this.mealName,
    required this.mealId,
    required this.mealArea,
    required this.mealRecipe,
    required this.mealImageUrl,
    required this.mealVideoUrl,
    required this.mealIngredients,
  });

  factory MealModel.fromJson(Map<String, dynamic> jsonData) {
    final List<IngredientModel> ingredients = [];

    for (int i = 1; i <= 20; i++) {
      final ingredientName = jsonData[kMealIngredientName + i.toString()];
      final ingredientMeasure = jsonData[kMealIngredientMeasure + i.toString()];
      if (ingredientName != null &&
          ingredientName.toString().trim().isNotEmpty &&
          ingredientMeasure != null &&
          ingredientMeasure.toString().trim().isNotEmpty) {
        ingredients.add(
          IngredientModel(
            ingredientName: ingredientName.toString(),
            ingredientMeasure: ingredientMeasure.toString(),
          ),
        );
      }
    }
    return MealModel(
      mealCategory: jsonData[kMealCategory] ?? '',
      mealName: jsonData[kMealName] ?? '',
      mealId: jsonData[kMealId] ?? '',
      mealArea: jsonData[kMealArea] ?? '',
      mealRecipe: jsonData[kMealRecipe] ?? '',
      mealImageUrl: jsonData[kMealImageUrl] ?? '',
      mealVideoUrl: jsonData[kMealVideoUrl] ?? '',
      mealIngredients: ingredients,
    );
  }
  toJson() {
    return {
      kMealId: mealId,
      kMealName: mealName,
      kMealCategory: mealCategory,
      kMealArea: mealArea,
      kMealRecipe: mealRecipe,
      kMealImageUrl: mealImageUrl,
      kMealVideoUrl: mealVideoUrl,
      kMealIngredientsList: mealIngredients.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
    mealName,
    mealId,
    mealArea,
    mealCategory,
    mealImageUrl,
    mealIngredients,
    mealRecipe,
    mealVideoUrl,
  ];
}
