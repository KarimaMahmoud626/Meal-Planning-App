import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/home/domain/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/domain/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';

class AddToCartFromFav extends StatefulWidget {
  const AddToCartFromFav({
    super.key,
    required this.item,
    this.buttonColor,
    required this.icon,
    this.selectedIcon,
    this.iconColor,
    this.iconSize,
  });

  final FavItemModel item;
  final Color? buttonColor;
  final IconData icon;
  final IconData? selectedIcon;
  final Color? iconColor;
  final double? iconSize;

  @override
  State<AddToCartFromFav> createState() => _AddToCartFromFavState();
}

class _AddToCartFromFavState extends State<AddToCartFromFav> {
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
              color: isInCart ? kMainColor : Colors.white,
            ),
            onPressed: () async {
              final cartCubit = context.read<CartCubit>();
              if (isInCart) {
                await cartCubit.removeItem(
                  CartItemModel.fromFavItem(widget.item),
                );
              } else {
                await cartCubit.addItemfromFav(widget.item);
              }
              setState(() {});
            },
          ),
        );
      },
    );
  }
}
