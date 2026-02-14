import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';

class IntCounter extends StatelessWidget {
  const IntCounter({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final num quantity = item.quantity!;
    return Row(
      spacing: 8,
      children: [
        CustomIconButton(
          onPressed: () async {
            if (quantity >= 1) {
              await context.read<CartCubit>().updateItem(item, quantity + 1);
            }
          },
          icon: Icons.add,
          iconColor: Color(0xFFFFFFFF),
          buttonColor: kMainColor,
        ),
        Text(quantity.toString(), style: TextStyle(fontSize: 16)),
        CustomIconButton(
          onPressed: () async {
            if (quantity > 1) {
              await context.read<CartCubit>().updateItem(item, quantity - 1);
            } else {
              context.read<CartCubit>().removeItem(item);
            }
          },
          icon: Icons.remove,
          iconColor: Color(0xFFFFFFFF),
          buttonColor: kMainColor,
        ),
      ],
    );
  }
}
