import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/suggested_meal_card.dart';

class SuggestedMealsView extends StatelessWidget {
  const SuggestedMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SuggestedMealCard(
            mealName: 'Green Goddess Grain Bowl',
            imagePath: 'assets/images/meals/salad.jpg',
          ),
          SuggestedMealCard(
            mealName: 'Green Goddess Grain Bowl',
            imagePath: 'assets/images/meals/salad.jpg',
          ),
          SuggestedMealCard(
            mealName: 'Green Goddess Grain Bowl',
            imagePath: 'assets/images/meals/salad.jpg',
          ),
        ],
      ),
    );
  }
}
