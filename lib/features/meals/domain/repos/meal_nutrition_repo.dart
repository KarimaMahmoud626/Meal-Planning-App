import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meals/domain/models/nutrition_model.dart';

abstract class MealNutritionRepo {
  Future<Either<Exception, List<NutritionModel>>> getMealNutrition();
}
