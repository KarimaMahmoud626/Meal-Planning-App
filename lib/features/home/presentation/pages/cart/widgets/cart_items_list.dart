import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/cart_view_item_card.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.items});

  final List<CartItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CartViewItemCard(item: items[index]),
          );
        },
      ),
    );
  }
}
