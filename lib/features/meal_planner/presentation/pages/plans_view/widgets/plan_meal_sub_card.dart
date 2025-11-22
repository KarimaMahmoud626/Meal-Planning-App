import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class PlanMealSubCard extends StatelessWidget {
  const PlanMealSubCard({super.key, this.filled = true});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: kMainColor.withOpacity(0.65),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child:
          filled
              ? Column(
                children: [
                  Text(
                    'Fetutcini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                  ),
                  RoundedRectangleNetworkImageContainer(
                    image:
                        'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg',
                    isBordered: false,
                    isPadded: false,
                    height: 10,
                    width: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: SizeConfig.defaultSize! * 4,
                        width: SizeConfig.defaultSize! * 10,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Show Recipe',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          '8:30 AM',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              )
              : Center(
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
