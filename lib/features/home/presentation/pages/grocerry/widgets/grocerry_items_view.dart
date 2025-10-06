import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_item_card.dart';

class GrocerryItemsView extends StatelessWidget {
  const GrocerryItemsView({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(4),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.9,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return GrocerryItemCard();
      },
    );
  }
}
