import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/home_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/cart_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/favorite_items_view.dart';

class BottomNavContainer extends StatelessWidget {
  BottomNavContainer({super.key});

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _buildScreens() {
    return [const HomeView(), const CartView(), const FavoriteItemsView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorites"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarHeight: SizeConfig.defaultSize! * 7,
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        colorBehindNavBar: Colors.white,
      ),
      //popAllScreensOnTapOfSelectedTab: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      navBarStyle: NavBarStyle.style9,
    );
  }
}
