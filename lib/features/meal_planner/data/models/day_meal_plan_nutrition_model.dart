import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/meal_planner/core/constants.dart';

class DayMealPlanNutritionModel extends Equatable {
  final num calories;
  final num fats;
  final num carbohydrates;
  final num protein;

  const DayMealPlanNutritionModel({
    required this.calories,
    required this.fats,
    required this.carbohydrates,
    required this.protein,
  });

  factory DayMealPlanNutritionModel.fromJson(Map<String, dynamic> jsonData) {
    return DayMealPlanNutritionModel(
      calories: jsonData[kCalories],
      fats: jsonData[kFat],
      carbohydrates: jsonData[kCarbohydrates],
      protein: jsonData[kProtein],
    );
  }

  @override
  List<Object?> get props => [calories, fats, carbohydrates, protein];
}
