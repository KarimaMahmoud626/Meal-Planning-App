import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/meals/data/models/search_meal_model.dart';
import 'package:meal_planning_app/features/meals/domain/repos/search_meal_repo.dart';

class SearchMealRepoImpl extends SearchMealRepo {
  @override
  Future<Either<Exception, List<SearchMealModel>>> searchMealsByName(
    String name,
  ) async {
    final List<SearchMealModel> mealsList = [];
    try {
      final mealUrl = Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$name&apiKey=$kSpoonAcularApiKey',
      );
      http.Response response = await http.get(mealUrl);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final meals = jsonData['results'];
        if (meals != null && meals.isNotEmpty) {
          for (var meal in meals) {
            mealsList.add(SearchMealModel.fromJson(meal));
          }
        }
      } else {
        return Left(Exception('HTTP error: ${response.statusCode}'));
      }
      print(mealsList);
      return Right(mealsList);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
