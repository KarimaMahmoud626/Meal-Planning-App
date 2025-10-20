import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/home/data/repos/suggested_meal_repo_impl.dart';
import 'package:meal_planning_app/features/home/domain/models/meal_model.dart';

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
}
