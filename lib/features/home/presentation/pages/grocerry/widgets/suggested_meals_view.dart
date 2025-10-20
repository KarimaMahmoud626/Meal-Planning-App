import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/suggested_meal_card.dart';

class SuggestedMealsView extends StatelessWidget {
  const SuggestedMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsCubit, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MealsLoaded) {
          final meals = state.meals;
          return SizedBox(
            height: SizeConfig.defaultSize! * 22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 4),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return SuggestedMealCard(meal: meals[index]);
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
