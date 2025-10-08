import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    this.iconSize = 24,
    this.itemId,
    this.isInitiallyLiked,
  });

  final double? iconSize;
  final String? itemId;

  final bool? isInitiallyLiked;

  @override
  State<FavouriteIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<FavouriteIconButton> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isInitiallyLiked!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrocerryItemsCubit, GrocerryItemsState>(
      builder: (context, state) {
        return IconButton(
          isSelected: isSelected,
          icon: Icon(
            Icons.favorite_border,
            color: Colors.black54,
            size: widget.iconSize,
          ),
          selectedIcon: Icon(
            Icons.favorite,
            color: Colors.red,
            size: widget.iconSize,
          ),
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
            context.read<GrocerryItemsCubit>().toggleLike(
              widget.itemId!,
              isSelected,
            );
          },
        );
      },
    );
  }
}
