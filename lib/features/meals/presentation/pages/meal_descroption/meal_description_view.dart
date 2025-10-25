import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/meal_description_view_body.dart';

class MealDescriptionView extends StatelessWidget {
  const MealDescriptionView({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MealsCubit()..getMealsById(mealId)),
        BlocProvider(create: (_) => FavMealsCubit()..getFavMeals()),
      ],
      child: Scaffold(body: MealDescriptionViewBody()),
    );
  }
}
