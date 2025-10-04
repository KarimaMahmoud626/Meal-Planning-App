import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/core/widgets/int_counter.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class CartViewItemCard extends StatelessWidget {
  const CartViewItemCard({
    super.key,
    required this.itemName,
    required this.price,
    required this.image,
  });

  final String itemName;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 17,
      width: SizeConfig.defaultSize! * 30,
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  RoundedRectangleImageContainer(height: 16, image: image),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTitleSubtitle(
                      title: itemName,
                      subTitle: price,
                      titleColor: Colors.black,
                      subTitleColor: kMainColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: SizeConfig.defaultSize! * 0.5,
              right: SizeConfig.defaultSize! * 0.5,
              child: IntCounter(),
            ),
          ],
        ),
      ),
    );
  }
}
