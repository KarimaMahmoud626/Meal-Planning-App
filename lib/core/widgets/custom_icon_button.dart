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
  });

  final Color? buttonColor;
  final IconData icon;
  final IconData? selectedIcon;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: iconSize, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}
