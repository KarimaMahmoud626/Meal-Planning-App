import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meals/domain/models/fav_meal_model.dart';

abstract class FavMealRepo {
  Future<void> addMealToFav(FavMealModel meal);
  Future<void> removeMealfromFav(FavMealModel meal);
  Future<Either<Exception, List<FavMealModel>>> getFavMealData();
  Future<void> updateMeal(FavMealModel item, bool liked);
}
