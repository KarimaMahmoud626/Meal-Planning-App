import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';

class AddMealSubCard extends StatelessWidget {
  const AddMealSubCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kMainColor.withOpacity(0.65),
      elevation: 4,
      child: Center(
        child: CustomIconButton(
          icon: Icons.add,
          buttonColor: kMainColor,
          iconColor: Colors.white,
          iconSize: 32,
          height: 36,
          width: 36,
        ),
      ),
    );
  }
}
