import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meals_view/widgets/meal_card.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MealsLoaded) {
          final meals = state.meals;
          return Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return MealCard(meal: meals[index]);
              },
            ),
          );
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
