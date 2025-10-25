import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meals/domain/models/nutrition_model.dart';
import 'package:meal_planning_app/features/meals/domain/repos/meal_nutrition_repo.dart';

class MealNutritionRepoImpl extends MealNutritionRepo {
  @override
  Future<Either<Exception, List<NutritionModel>>> getMealNutrition() {
    // TODO: implement getMealNutrition
    throw UnimplementedError();
  }
}
