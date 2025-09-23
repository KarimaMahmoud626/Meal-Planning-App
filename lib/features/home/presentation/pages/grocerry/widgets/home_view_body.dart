import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/suggested_meals_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [SuggestedMealsView()]);
  }
}
