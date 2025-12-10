import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meals/data/models/search_meal_model.dart';

abstract class SearchMealRepo {
  Future<Either<Exception, List<SearchMealModel>>> searchMealsByName(
    String name,
  );
}
