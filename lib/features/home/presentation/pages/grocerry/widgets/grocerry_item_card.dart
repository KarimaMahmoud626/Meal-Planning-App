import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/add_item_to_cart_button.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocery_item_fav_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class GrocerryItemCard extends StatelessWidget {
  const GrocerryItemCard({super.key, required this.item});

  final GrocerryItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 22,
      width: SizeConfig.defaultSize! * 20,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                RoundedRectangleNetworkImageContainer(image: item.imageUrl),
                Positioned(
                  bottom: SizeConfig.defaultSize! * 7,
                  right: SizeConfig.defaultSize! * 0.5,
                  child: FavouriteIconButton(item: item),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: SizeConfig.defaultSize! * 8,
              child: Stack(
                children: [
                  CustomTitleSubtitle(
                    title: item.name,
                    titleColor: Color(0xFF000000),
                    subTitle: '\$${item.price}',
                    subTitleColor: kMainColor,
                  ),
                  Positioned(
                    bottom: SizeConfig.defaultSize! * 0.5,
                    right: SizeConfig.defaultSize! * 0.5,
                    child: AddItemToCartButton(
                      item: item,
                      iconColor: Colors.white,
                      buttonColor: kMainColor,
                      icon: Icons.add,
                      selectedIcon: Icons.check,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
