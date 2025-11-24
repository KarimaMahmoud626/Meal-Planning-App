import 'package:meal_planning_app/features/meal_planner/data/models/week_meal_plan_model.dart';

sealed class PlannerState {}

class PlannerLoading extends PlannerState {}

class PlannerLoadded extends PlannerState {
  WeekMealPlanModel planModel;
  PlannerLoadded({required this.planModel});
}

class PlannerFailure extends PlannerState {
  final String? message;

  PlannerFailure(this.message);
}
