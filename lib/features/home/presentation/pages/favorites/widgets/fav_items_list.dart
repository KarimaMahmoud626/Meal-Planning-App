import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/domain/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/favorite_item_card.dart';

class FavItemsList extends StatelessWidget {
  const FavItemsList({super.key, required this.items});

  final List<FavItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return FavoriteItemCard(item: items[index]);
      },
    );
  }
}
