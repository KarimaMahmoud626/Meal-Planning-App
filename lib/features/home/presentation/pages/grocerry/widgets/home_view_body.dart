import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:meal_planning_app/core/widgets/text_with_text_button_row.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/favorite_items_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/favorite_items_view_body.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextWithTextButtonRow(
            title: 'Favourites',
            onPressed: () {
              Get.to(
                () => FavoriteItemsView(),
                duration: Duration(microseconds: 500),
                transition: getx.Transition.rightToLeft,
              );
            },
          ),
          FavoriteItemsViewBody(),
          TextWithTextButtonRow(title: 'Grocery'),
          GrocerryView(),
        ],
      ),
    );
  }
}
