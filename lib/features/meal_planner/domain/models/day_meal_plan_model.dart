import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meal_planner/domain/models/planner_meal_model.dart';
import 'package:meal_planning_app/features/meals/domain/models/nutrition_response_model.dart';

class DayMealPlanModel extends Equatable {
  final List<NutritionResponseModel> dayPlanNutritionSummary;
  final List<NutritionResponseModel> breakfastNutritionSummary;
  final List<NutritionResponseModel> lunchNutritionSummary;
  final List<NutritionResponseModel> dinnerNutritionSummary;
  final String dayName;
  final List<PlannerMealModel> items;

  const DayMealPlanModel({
    required this.dayPlanNutritionSummary,
    required this.breakfastNutritionSummary,
    required this.lunchNutritionSummary,
    required this.dinnerNutritionSummary,
    required this.dayName,
    required this.items,
  });

  factory DayMealPlanModel.fromJson(Map<String, dynamic> jsonData) {
    List<NutritionResponseModel> parseNutrients(Map<String, dynamic> section) {
      return (section['nutrients'] as List)
          .map((e) => NutritionResponseModel.fromJson(e))
          .toList();
    }

    return DayMealPlanModel(
      dayPlanNutritionSummary: parseNutrients(jsonData[kNutritionSummary]),
      breakfastNutritionSummary: parseNutrients(
        jsonData[kBreakfastNutritionSummary],
      ),
      lunchNutritionSummary: parseNutrients(jsonData[kLunchNutritionSummary]),
      dinnerNutritionSummary: parseNutrients(jsonData[kDinnerNutritionSummary]),
      dayName: jsonData[kDay],
      items:
          (jsonData[kItems] as List)
              .map((e) => PlannerMealModel.fromJson(e))
              .toList(),
    );
  }

  @override
  List<Object?> get props => [
    dayPlanNutritionSummary,
    breakfastNutritionSummary,
    lunchNutritionSummary,
    dinnerNutritionSummary,
    dayName,
    items,
  ];
}
