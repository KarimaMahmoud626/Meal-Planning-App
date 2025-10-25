import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/meal_description_view_body_content.dart';

class MealDescriptionViewBody extends StatelessWidget {
  const MealDescriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MealDataLoaded) {
          final meal = state.meal;
          return MealDescriptionViewBodyContent(meal: meal);
        } else if (state is MealsError) {
          return Center(child: Text(state.errorMessage.toString()));
        } else if (state is MealsEmpty) {
          return Center(child: Text('No Meals'));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }
}
