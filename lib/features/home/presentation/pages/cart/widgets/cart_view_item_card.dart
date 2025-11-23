import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/int_counter.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class CartViewItemCard extends StatelessWidget {
  const CartViewItemCard({super.key, required this.item});

  final CartItemModel item;

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
                  RoundedRectangleNetworkImageContainer(
                    height: 16,
                    image: item.imageUrl,
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomTitleSubtitle(
                        title: item.name,
                        subTitle: '\$${item.price}',
                        titleColor: Colors.black,
                        subTitleColor: kMainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: SizeConfig.defaultSize! * 0.5,
              right: SizeConfig.defaultSize! * 0.5,
              child: IntCounter(item: item),
            ),
          ],
        ),
      ),
    );
  }
}
