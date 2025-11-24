import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/add_meal_sub_card.dart';

class AddMealCard extends StatelessWidget {
  const AddMealCard({super.key, required this.mealTime});
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
            Expanded(child: AddMealSubCard()),
          ],
        ),
      ),
    );
  }
}
