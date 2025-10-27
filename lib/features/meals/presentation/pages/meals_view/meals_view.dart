import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meals_view/widgets/meals_view_body.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit()..getMealsByCategory(categoryName),

      child: Scaffold(
        appBar: SimpleAppBar(pageName: categoryName, withFavButton: true),
        body: MealsViewBody(),
      ),
    );
  }
}
