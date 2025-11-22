import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meal_planner/domain/models/day_meal_plan_model.dart';

abstract class MealPlannerRepo {
  Future<Either<Exception, List<DayMealPlanModel>>> getMealPlans();
}
