import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/meal_info_model.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/plan_meal_sub_card.dart';

class PlanMealCard extends StatelessWidget {
  const PlanMealCard({
    super.key,
    this.filled = true,
    required this.meal,
    required this.mealTime,
  });
  final bool filled;
  final MealInfoModel meal;
  final String mealTime;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Text(
              mealTime,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Expanded(child: PlanMealSubCard(filled: filled, meal: meal)),
          ],
        ),
      ),
    );
  }
}
