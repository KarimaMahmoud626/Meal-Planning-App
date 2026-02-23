import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/navigation_helper.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/core/widgets/custom_search_bar.dart';
import 'package:meal_planning_app/core/widgets/user_profile.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpace(4),
            Row(
              children: [
                UserProfile(user: user),
                Spacer(),
                IconButton(
                  onPressed: () {
                    NavigationHelper.toPlan(context);
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            VerticalSpace(1.5),
            CustomSearchBar(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.defaultSize! * 18);
}

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    super.key,
    required this.pageName,
    this.withFavButton = false,
    this.withDefaultColor = true,
  });

  final String pageName;
  final bool withFavButton;
  final bool withDefaultColor;

  @override
  Widget build(BuildContext context) {
    return withFavButton
        ? SizedBox(
          height: SizeConfig.defaultSize! * 13,
          child: Container(
            decoration: BoxDecoration(
              color: withDefaultColor ? kMainColor : Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      NavigationHelper.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                      color: withDefaultColor ? Colors.white : kMainColor,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        pageName,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  // const SizedBox(width: 48),
                  IconButton(
                    onPressed: () {
                      NavigationHelper.toFavMeals(context);
                    },
                    icon: Icon(Icons.favorite, size: 32, color: Colors.white),
                  ),
                  HorizontalSpace(1),
                ],
              ),
            ),
          ),
        )
        : SizedBox(
          height: SizeConfig.defaultSize! * 13,
          child: Container(
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      NavigationHelper.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        pageName,
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),

                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.defaultSize! * 16);
}
