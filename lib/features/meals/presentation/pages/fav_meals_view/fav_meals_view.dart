import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/fav_meals_view/widgets/fav_meals_view_body.dart';

class FavMealsView extends StatelessWidget {
  const FavMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavMealsCubit()..getFavMeals(),
      child: Scaffold(
        appBar: SimpleAppBar(pageName: 'Your Fav Meals'),
        body: FavMealsViewBody(),
      ),
    );
  }
}
