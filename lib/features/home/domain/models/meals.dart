import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/meals/domain/models/meal_model.dart';

class Meals extends Equatable {
  final List<MealModel> meals;

  Meals({required this.meals});

  factory Meals.fromJson(Map<String, dynamic> jsonData) {
    return Meals(meals: jsonData['meals']);
  }

  @override
  List<Object?> get props => [meals];
}
