import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/features/home/data/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/add_to_cart_from_fav.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({super.key, required this.item});

  final FavItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 25,
      width: SizeConfig.defaultSize! * 28,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Positioned.fill(
              child: RoundedRectangleNetworkImageContainer(
                image: item.imageUrl,
                isBordered: false,
                isPadded: false,
              ),
            ),
            Positioned(
              top: SizeConfig.defaultSize!,
              right: SizeConfig.defaultSize!,
              child: AddToCartFromFav(
                icon: (Icons.shopping_cart_outlined),
                selectedIcon: (Icons.shopping_cart_checkout),
                buttonColor: Colors.black.withOpacity(0.15),
                iconColor: Colors.white,
                item: item,
              ),
            ),
            Positioned(
              top: SizeConfig.defaultSize!,
              left: SizeConfig.defaultSize!,
              child: CustomIconButton(
                icon: Icons.favorite,
                iconSize: 24,
                iconColor: Colors.red,
                buttonColor: Colors.black.withOpacity(0.15),
                onPressed: () async {
                  await context.read<FavouriteCubit>().removeItem(item);
                },
              ),
            ),
            Positioned.fill(
              top: SizeConfig.defaultSize! * 10,
              child: Container(
                width: SizeConfig.defaultSize! * 20,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    item.name!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
