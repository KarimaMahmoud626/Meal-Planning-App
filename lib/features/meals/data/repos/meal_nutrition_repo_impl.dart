import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/meals/data/models/nutrition_request_model.dart';
import 'package:meal_planning_app/features/meals/data/models/nutrition_response_model.dart';
import 'package:meal_planning_app/features/meals/domain/repos/meal_nutrition_repo.dart';

class MealNutritionRepoImpl extends MealNutritionRepo {
  @override
  Future<Either<Exception, List<NutritionResponseModel>>> analyzeRecipe(
    String apiKey,
    NutritionRequestModel model,
  ) async {
    print('entering recipe analyze');
    final url = Uri.parse(
      'https://api.spoonacular.com/recipes/analyze?includeNutrition=true&apiKey=$apiKey',
    );
    final body = jsonEncode({
      kTitle: model.title,
      kServings: model.servings,
      kInngredients: model.ingredients,
      kInstructions: model.instructions,
    });

    final resp = await http.post(
      url,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      final nutrients = (data['nutrition']?['nutrients'] as List);
      print(jsonEncode(data['nutrition']['nutrients']));
      final filteredNutrients =
          nutrients
              .where((n) {
                final name = (n['name']).toString();
                return name == 'Calories' ||
                    name == 'Protein' ||
                    name == 'Fat' ||
                    name == 'Carbohydrates' ||
                    name == 'Sugar';
              })
              .map((n) => NutritionResponseModel.fromJson(n))
              .toList();

      print('filtered nutrients got: ${filteredNutrients.length}');
      return Right(filteredNutrients);
    } else {
      print('exception caught');
      return Left(
        Exception('Spoonacular error ${resp.statusCode}: ${resp.body}'),
      );
    }
  }
}
