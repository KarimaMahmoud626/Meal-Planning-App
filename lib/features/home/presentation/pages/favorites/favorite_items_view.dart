import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';

class FavoriteItemsView extends StatelessWidget {
  const FavoriteItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(pageName: 'Favorites'),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
