import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/day_meal_plan_model.dart';

class WeekMealPlanModel extends Equatable {
  final DayMealPlanModel monday;
  final DayMealPlanModel tuesday;
  final DayMealPlanModel wednesday;
  final DayMealPlanModel thursday;
  final DayMealPlanModel friday;
  final DayMealPlanModel saturday;
  final DayMealPlanModel sunday;

  const WeekMealPlanModel({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory WeekMealPlanModel.fromJson(Map<String, dynamic> jsonData) {
    final week = jsonData['week'];
    return WeekMealPlanModel(
      monday: DayMealPlanModel.fromJson(week['monday']),
      tuesday: DayMealPlanModel.fromJson(week['tuesday']),
      wednesday: DayMealPlanModel.fromJson(week['wednesday']),
      thursday: DayMealPlanModel.fromJson(week['thursday']),
      friday: DayMealPlanModel.fromJson(week['friday']),
      saturday: DayMealPlanModel.fromJson(week['saturday']),
      sunday: DayMealPlanModel.fromJson(week['sunday']),
    );
  }

  @override
  List<Object?> get props => [
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
  ];
}
