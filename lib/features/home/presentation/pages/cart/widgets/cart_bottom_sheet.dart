import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/core/widgets/text_row.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            VerticalSpace(2),
            TextRow(headText: 'Total Price:', valueText: '\$120'),
            TextRow(headText: 'Total Calories:', valueText: '1000cal'),
            VerticalSpace(1),
            SizedBox(
              height: 40,
              width: SizeConfig.screenWidth! * 0.7,
              child: CustomGeneralButton(text: 'Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
