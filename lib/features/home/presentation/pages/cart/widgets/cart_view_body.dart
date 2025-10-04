import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/cart_view_item_card.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: CartViewItemCard(),
        );
      },
    );
  }
}
