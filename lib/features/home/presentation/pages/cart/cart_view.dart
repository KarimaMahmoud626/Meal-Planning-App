import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/cart_view_body.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: CartViewBody());
  }
}
