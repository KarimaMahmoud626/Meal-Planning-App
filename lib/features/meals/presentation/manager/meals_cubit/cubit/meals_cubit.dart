import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/meals/data/repos/suggested_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/domain/models/meal_model.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final repo = SuggestedMealRepoImpl();

  MealsCubit() : super(MealsLoading());

  getSuggestedMeals(int numOfMeals) async {
    try {
      final result = await repo.getRandomMeals(numOfMeals);

      result.fold((error) => emit(MealsError(error.toString())), (meals) {
        if (meals.isNotEmpty) {
          emit(MealsLoaded(meals));
        } else {
          emit(MealsEmpty());
        }
      });
    } catch (e) {
      Exception(e.toString());
    }
  }

  getMealsByCategory(String category) async {
    try {
      final result = await repo.getMealsByCategory(category.toLowerCase());

      result.fold((error) => emit(MealsError(error.toString())), (meals) {
        if (meals.isNotEmpty) {
          emit(MealsLoaded(meals));
        } else {
          emit(MealsEmpty());
        }
      });
    } catch (e) {
      Exception(e.toString());
    }
  }

  getMealsById(String id) async {
    try {
      final result = await repo.getMealsById(id);

      result.fold((error) => emit(MealsError(error.toString())), (meal) {
        emit(MealDataLoaded(meal));
      });
    } catch (e) {
      Exception(e.toString());
    }
  }

  toggleLike(String id, bool isLiked) async {
    await repo.toggleLike(id, isLiked);
  }
}
