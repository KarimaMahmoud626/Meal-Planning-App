import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, this.text, this.onTap});
  final String? text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class CustomLoginWithButton extends StatelessWidget {
  const CustomLoginWithButton({
    super.key,
    this.icon,
    required this.text,
    this.iconColor,
    this.onTap,
  });

  final IconData? icon;
  final String text;
  final Color? iconColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Color(0xFF707070)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor),
            HorizontalSpace(2),
            Text(
              text,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key, this.onTap, this.isLoading = false});

  final void Function()? onTap;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child:
              isLoading
                  ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(color: Colors.black),
                  )
                  : Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
