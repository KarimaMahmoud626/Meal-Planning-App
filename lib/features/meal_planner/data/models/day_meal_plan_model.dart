import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/meal_planner/core/constants.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/day_meal_plan_nutrition_model.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/meal_info_model.dart';

class DayMealPlanModel extends Equatable {
  final List<MealInfoModel> meals;
  final DayMealPlanNutritionModel nutritions;

  const DayMealPlanModel({required this.meals, required this.nutritions});

  factory DayMealPlanModel.fromJson(Map<String, dynamic> jsonData) {
    return DayMealPlanModel(
      meals:
          (jsonData[kMeals] as List<dynamic>)
              .map((meal) => MealInfoModel.fromJson(meal))
              .toList(),
      nutritions: DayMealPlanNutritionModel.fromJson(jsonData[kNutrients]),
    );
  }

  @override
  List<Object?> get props => [meals, nutritions];
}
