import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/favorite_item_card.dart';

class FavoriteItemsViewBody extends StatelessWidget {
  const FavoriteItemsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemCount: 2,
      itemBuilder: (context, index) {
        return FavoriteItemCard();
      },
    );
  }
}
