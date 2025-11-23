import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';

class AddItemToCartButton extends StatefulWidget {
  const AddItemToCartButton({
    super.key,
    required this.item,
    this.buttonColor,
    required this.icon,
    this.selectedIcon,
    this.iconColor,
    this.iconSize,
  });

  final GrocerryItemModel item;
  final Color? buttonColor;
  final IconData icon;
  final IconData? selectedIcon;
  final Color? iconColor;
  final double? iconSize;

  @override
  State<AddItemToCartButton> createState() => _AddItemToCartButtonState();
}

class _AddItemToCartButtonState extends State<AddItemToCartButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        bool isInCart = false;
        if (state is CartLoaded) {
          isInCart = state.items.any(
            (cartItem) => cartItem.name == widget.item.name,
          );
        }
        return Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              isInCart ? widget.selectedIcon : widget.icon,
              size: widget.iconSize,
              color: widget.iconColor,
            ),
            onPressed: () async {
              final cartCubit = context.read<CartCubit>();
              if (isInCart) {
                await cartCubit.removeItem(
                  CartItemModel.fromGrocerryItem(widget.item),
                );
              } else {
                await cartCubit.addItem(widget.item);
              }
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
