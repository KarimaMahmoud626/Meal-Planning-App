import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/suggested_meals/widgets/suggested_meals_view_body.dart';

class SuggestedMealsView extends StatelessWidget {
  const SuggestedMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SuggestedMealsViewBody(),
    );
  }
}
