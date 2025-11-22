import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/fav_meals_view/widgets/fav_meals_view_body.dart';

class FavMealsView extends StatelessWidget {
  const FavMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: FavMealsViewBody(),
    );
  }
}
