import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/navigation_helper.dart';
import 'package:meal_planning_app/core/widgets/text_with_text_button_row.dart';
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
              NavigationHelper.toFavorites(context);
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
