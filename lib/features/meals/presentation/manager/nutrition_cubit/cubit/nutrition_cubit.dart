import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meals/data/repos/meal_nutrition_repo_impl.dart';

import 'package:meal_planning_app/features/meals/data/models/nutrition_request_model.dart';
import 'package:meal_planning_app/features/meals/data/models/nutrition_response_model.dart';

part 'nutrition_state.dart';

class NutritionCubit extends Cubit<NutritionState> {
  final repo = MealNutritionRepoImpl();

  NutritionCubit() : super(NutritionLoading());

  getNutritionSummary(NutritionRequestModel model) async {
    print('entering nutrition summary');
    emit(NutritionLoading());
    try {
      final result = await repo.analyzeRecipe(kSpoonAcularApiKey, model);

      result.fold(
        (error) {
          print('nutrition error: $error');
          emit(NutritionError(error.toString()));
        },
        (nutrients) {
          if (nutrients.isNotEmpty) {
            print('nutrition loaded');
            emit(NutritionLoaded(nutrients));
          } else {
            print('nutrition empty');
            emit(NutritionEmpty());
          }
        },
      );
    } catch (e, s) {
      print('nutrition exception: $e\n$s');
      emit(NutritionError(e.toString()));
    }
  }
}
