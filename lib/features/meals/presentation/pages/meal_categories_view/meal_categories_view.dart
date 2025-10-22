import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/widgets/meal_categories_view_body.dart';

class MealCategoriesView extends StatelessWidget {
  const MealCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit(),
      child: Scaffold(
        appBar: SimpleAppBar(pageName: 'Meal Categories'),
        body: MealCategoriesViewBody(),
      ),
    );
  }
}
