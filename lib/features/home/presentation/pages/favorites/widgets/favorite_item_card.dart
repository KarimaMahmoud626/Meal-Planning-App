import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';
import 'package:meal_planning_app/features/home/domain/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';

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
              ),
            ),

            Positioned(
              bottom: SizeConfig.defaultSize!,
              left: SizeConfig.defaultSize! * 2,
              right: SizeConfig.defaultSize! * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: SizeConfig.defaultSize! * 5,
                    width: SizeConfig.defaultSize! * 15,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        context.read<CartCubit>().addItemfromFav(item);
                      },
                      child: Text(
                        'Add to Card',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.favorite,
                    iconSize: 28,
                    iconColor: Colors.red,
                    buttonColor: Colors.transparent,
                    onPressed: () async {
                      await context.read<FavouriteCubit>().removeItem(item);
                    },
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
