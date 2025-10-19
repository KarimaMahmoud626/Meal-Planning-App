import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_categories_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_items_view.dart';

class GrocerryView extends StatelessWidget {
  const GrocerryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [GrocerryCategoriesView(), GrocerryItemsView()]);
  }
}
