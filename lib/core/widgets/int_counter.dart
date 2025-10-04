import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';

class IntCounter extends StatelessWidget {
  const IntCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CustomIconButton(
          icon: Icons.add,
          iconColor: Color(0xFFFFFFFF),
          buttonColor: kMainColor,
        ),
        Text('1', style: TextStyle(fontSize: 16)),
        CustomIconButton(
          icon: Icons.remove,
          iconColor: Color(0xFFFFFFFF),
          buttonColor: kMainColor,
        ),
      ],
    );
  }
}
