import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/domain/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({
    super.key,
    this.iconSize = 24,
    required this.item,
  });

  final double? iconSize;
  final GrocerryItemModel item;

  @override
  State<FavouriteIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<FavouriteIconButton> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.item.liked!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        bool isInFav = false;
        if (state is FavLoaded) {
          isInFav = state.items.any(
            (favItem) => favItem.name == widget.item.name,
          );
        }
        return IconButton(
          isSelected: isInFav,
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
          onPressed: () async {
            setState(() {
              isSelected = !isSelected;
            });
            context.read<GrocerryItemsCubit>().toggleLike(
              widget.item.id!,
              isSelected,
            );
            final favCubit = context.read<FavouriteCubit>();
            if (isInFav) {
              await favCubit.removeItem(widget.item.toFavItem());
            } else {
              await favCubit.addItem(widget.item);
            }
          },
        );
      },
    );
  }
}
