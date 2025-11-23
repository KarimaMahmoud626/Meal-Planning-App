import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meals/data/models/fav_meal_model.dart';
import 'package:meal_planning_app/features/meals/data/models/ingredient_model.dart';
import 'package:meal_planning_app/features/meals/data/models/nutrition_request_model.dart';

class MealModel extends Equatable {
  final String mealName;
  final String mealId;
  final String? mealArea;
  final String? mealRecipe;
  final String mealImageUrl;
  final String? mealVideoUrl;
  final String mealCategory;
  final List<IngredientModel>? mealIngredients;
  final bool? liked;

  const MealModel({
    required this.mealCategory,
    required this.mealName,
    required this.mealId,
    this.mealArea,
    this.mealRecipe,
    required this.mealImageUrl,
    this.mealVideoUrl,
    this.mealIngredients,
    this.liked = false,
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
      kMealIngredientsList: mealIngredients!.map((e) => e.toJson()).toList(),
    };
  }

  factory MealModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MealModel(
      mealName: data[kName],
      mealImageUrl: data[kMealImageUrl],
      liked: data[kLiked],
      mealId: data[kMealId],
      mealCategory: data[kMealCategory],
    );
  }

  Map<String, dynamic> toFirestore() {
    final data = <String, dynamic>{
      kName: mealName,
      kMealArea: mealArea,
      kMealImageUrl: mealImageUrl,
      kLiked: liked,
    };
    data.removeWhere((key, value) => value == null);
    return data;
  }

  FavMealModel toFavMealModel() {
    return FavMealModel(
      mealName: mealName,
      mealId: mealId,
      mealImageUrl: mealImageUrl,
      mealCategory: mealCategory,
      mealArea: mealArea ?? '',
      liked: liked ?? false,
    );
  }

  NutritionRequestModel toNutritionModel() {
    final mealIngredientsList =
        mealIngredients
            ?.map((i) => '${i.ingredientMeasure} ${i.ingredientName}')
            .toList() ??
        [];

    return NutritionRequestModel(
      title: mealName,
      servings: 1,
      instructions: mealRecipe ?? '',
      ingredients: mealIngredientsList,
    );
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
    liked,
  ];
}
