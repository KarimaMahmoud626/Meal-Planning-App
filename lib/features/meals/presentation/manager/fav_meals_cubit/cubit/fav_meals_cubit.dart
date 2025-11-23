import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/meals/data/repos/fav_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/data/models/fav_meal_model.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';

part 'fav_meals_state.dart';

class FavMealsCubit extends Cubit<FavMealsState> {
  final repo = FavMealRepoImpl();

  FavMealsCubit() : super(FavMealsLoading());

  Future<void> getFavMeals() async {
    final result = await repo.getFavMealData();

    result.fold((error) => emit(FavError(errorMessage: error.toString())), (
      items,
    ) {
      if (items.isEmpty) {
        emit(FavMealsEmpty());
      } else {
        emit(FavMealsLoaded(items));
      }
    });
  }

  Future<void> addMeal(MealModel meal) async {
    print('entering fav meal cubit');
    try {
      await repo.addMealToFav(meal.toFavMealModel());
      await updateMeal(meal.toFavMealModel(), true);
      await getFavMeals();
    } catch (e) {
      emit(FavError(errorMessage: e.toString()));
      print(e);
    }
  }

  Future<void> removeMeal(FavMealModel meal) async {
    try {
      emit(FavMealsLoading());
      await repo.removeMealfromFav(meal);
      await getFavMeals();
    } catch (e) {
      emit(FavError(errorMessage: e.toString()));
    }
  }

  Future<void> updateMeal(FavMealModel meal, bool liked) async {
    try {
      await repo.updateMeal(meal, liked);
      await getFavMeals();
    } catch (e) {
      emit(FavError(errorMessage: e.toString()));
    }
  }
}
