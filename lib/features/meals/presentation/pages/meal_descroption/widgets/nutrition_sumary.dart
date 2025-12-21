import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/data/repos/meal_nutrition_repo_impl.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/nutrition_cubit/cubit/nutrition_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/nutrition_summary_body.dart';

class NutritionSumary extends StatelessWidget {
  const NutritionSumary({super.key, required this.meal});

  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          ((context) =>
              NutritionCubit(repo: MealNutritionRepoImpl())
                ..getNutritionSummary(meal.toNutritionModel())),
      child: BlocBuilder<NutritionCubit, NutritionState>(
        builder: (BuildContext context, state) {
          if (state is NutritionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NutritionLoaded) {
            final nutrients = state.nutrients;
            final items = nutrients;

            return NutritionSummaryBody(items: items);
          } else if (state is NutritionError) {
            return Center(child: Text(state.errorMessage.toString()));
          } else if (state is NutritionEmpty) {
            return Center(
              child: Text('Nutrition Summary for this meal is not available'),
            );
          } else {
            return Center(child: Text(''));
          }
        },
      ),
    );
  }
}
