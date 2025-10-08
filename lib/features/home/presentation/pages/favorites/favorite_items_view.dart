import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/favorite_items_view_body.dart';

class FavoriteItemsView extends StatelessWidget {
  const FavoriteItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: FavoriteItemsViewBody());
  }
}
