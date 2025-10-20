import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:meal_planning_app/core/widgets/text_row.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/suggested_meals_view.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meals/meals_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit()..getSuggestedMeals(4),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextRow(
              title: 'Suggested Meals',
              onPressed: () {
                Get.to(
                  () => MealsView(),
                  duration: const Duration(milliseconds: 500),
                  transition: getx.Transition.rightToLeft,
                );
              },
            ),
            SuggestedMealsView(),
            TextRow(title: 'Grocery'),
            GrocerryView(),
          ],
        ),
      ),
    );
  }
}
