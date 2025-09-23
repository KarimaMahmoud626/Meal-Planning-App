import 'package:flutter/material.dart';

class FavouriteIconButton extends StatefulWidget {
  const FavouriteIconButton({super.key});

  @override
  State<FavouriteIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<FavouriteIconButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: isSelected,
      icon: Icon(Icons.favorite_border, color: Colors.black54, size: 24),
      selectedIcon: Icon(Icons.favorite, color: Colors.red, size: 24),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
