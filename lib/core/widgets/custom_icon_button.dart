import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.buttonColor,
    required this.icon,
    this.iconColor,
    this.iconSize = 24,
    this.onPressed,
    this.selectedIcon,
    this.isSelected,
    this.selectedIconColor,
    this.height = 28,
    this.width = 28,
  });

  final Color? buttonColor;
  final IconData icon;
  final IconData? selectedIcon;
  final Color? iconColor;
  final Color? selectedIconColor;
  final double? iconSize;
  final void Function()? onPressed;
  final bool? isSelected;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        isSelected: isSelected ?? false,
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: iconSize, color: iconColor),
        selectedIcon: Icon(selectedIcon, size: iconSize, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
