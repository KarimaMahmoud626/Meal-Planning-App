import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/home/data/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/favorite_item_card.dart';

class FavItemsList extends StatelessWidget {
  const FavItemsList({
    super.key,
    required this.items,
    this.isHorizontal = true,
  });

  final List<FavItemModel> items;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 15,
      child: ListView.builder(
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FavoriteItemCard(item: items[index]);
        },
      ),
    );
  }
}
