import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meals/domain/models/nutrition_request_model.dart';
import 'package:meal_planning_app/features/meals/domain/models/nutrition_response_model.dart';

abstract class MealNutritionRepo {
  Future<Either<Exception, List<NutritionResponseModel>>> analyzeRecipe(
    String apiKey,
    NutritionRequestModel model,
  );
}
