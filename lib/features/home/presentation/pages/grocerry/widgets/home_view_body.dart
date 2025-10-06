import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/text_row.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_categories_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_items_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/suggested_meals_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextRow(title: 'Suggested Meals'),
          SuggestedMealsView(),
          TextRow(title: 'Categories'),
          GrocerryCategoriesView(),
          GrocerryItemsView(itemCount: 4),
        ],
      ),
    );
  }
}
