import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/meals/data/models/search_meal_model.dart';

class MealSearchCard extends StatelessWidget {
  const MealSearchCard({super.key, this.meal});

  final SearchMealModel? meal;

  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.defaultSize! * 10;
    return Container(
      padding: EdgeInsets.all(8),
      height: height,
      width: SizeConfig.screenWidth! * 0.98,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 0,
            child: RoundedRectangleNetworkImageContainer(
              image: meal!.imageUrl,
              height: height,
              isBordered: false,
              isPadded: false,
            ),
          ),
          HorizontalSpace(1),
          Expanded(
            flex: 1,
            child: Text(
              meal!.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
