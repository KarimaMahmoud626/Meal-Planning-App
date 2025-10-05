import 'package:flutter/material.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({super.key, this.iconSize = 24});

  final double? iconSize;

  @override
  State<FavouriteIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<FavouriteIconButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
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
      },
    );
  }
}
