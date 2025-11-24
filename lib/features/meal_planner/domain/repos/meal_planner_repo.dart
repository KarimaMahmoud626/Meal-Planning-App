import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/week_meal_plan_model.dart';

abstract class MealPlannerRepo {
  Future<Either<Exception, WeekMealPlanModel>> getMealPlans();
}
