import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/widgets/meal_categories_list.dart';

class MealCategoriesViewBody extends StatelessWidget {
  const MealCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: MealCategoriesList());
  }
}
