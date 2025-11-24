import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/week_meal_plan_model.dart';
import 'package:meal_planning_app/features/meal_planner/domain/repos/meal_planner_repo.dart';

class GetWeekPlanUsecase {
  final MealPlannerRepo repo;

  GetWeekPlanUsecase({required this.repo});
  Future<Either<Exception, WeekMealPlanModel>> call() async {
    return await repo.getMealPlans();
  }
}
