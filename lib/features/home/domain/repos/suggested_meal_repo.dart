import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/home/domain/models/meal_model.dart';

abstract class SuggestedMealRepo {
  Future<Either<Exception, List<MealModel>>> getRandomMeals(int numOfMeals);
  Future<Either<Exception, List<MealModel>>> getMealsByCategory(
    String category,
  );
}
