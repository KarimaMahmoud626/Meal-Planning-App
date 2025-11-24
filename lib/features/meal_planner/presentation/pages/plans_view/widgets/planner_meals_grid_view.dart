import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/day_meal_plan_model.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/add_meal_card.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/plan_meal_card.dart';

class PlannerMealsGridView extends StatelessWidget {
  PlannerMealsGridView({super.key, required this.plan});

  final DayMealPlanModel plan;
  final List<String> meals = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.99,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(4),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return (index < 3)
              ? PlanMealCard(meal: plan.meals[index], mealTime: meals[index])
              : AddMealCard(mealTime: meals[index]);
        },
      ),
    );
  }
}
