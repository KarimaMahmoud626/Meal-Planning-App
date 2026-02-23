import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/routes/app_routes.dart';
import 'package:meal_planning_app/core/widgets/text_with_text_button_row.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/suggested_meals/widgets/suggested_meals_list.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/widgets/meal_categories_list.dart';

class SuggestedMealsViewBody extends StatelessWidget {
  const SuggestedMealsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextWithTextButtonRow(title: 'Recommended For you'),
          SuggestedMealsList(),
          TextWithTextButtonRow(
            title: 'Meal Categories',
            onPressed: () {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushNamed(AppRoutes.mealCategories);
            },
          ),
          MealCategoriesList(numberOfCategories: 4),
        ],
      ),
    );
  }
}
