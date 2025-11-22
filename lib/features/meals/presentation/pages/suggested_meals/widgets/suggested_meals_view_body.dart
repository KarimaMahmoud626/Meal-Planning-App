import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:meal_planning_app/core/widgets/text_row.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/meal_categories_view.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/suggested_meals/widgets/suggested_meals_list.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/widgets/meal_categories_list.dart';

class SuggestedMealsViewBody extends StatelessWidget {
  const SuggestedMealsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextRow(title: 'Recommended For you'),
          SuggestedMealsList(),
          TextRow(
            title: 'Meal Categories',
            onPressed: () {
              Get.to(
                () => MealCategoriesView(),
                duration: Duration(milliseconds: 500),
                transition: getx.Transition.rightToLeft,
              );
            },
          ),
          MealCategoriesList(numberOfCategories: 4),
        ],
      ),
    );
  }
}
