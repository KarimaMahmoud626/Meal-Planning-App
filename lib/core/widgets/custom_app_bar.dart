import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/core/widgets/custom_search_bar.dart';
import 'package:meal_planning_app/core/widgets/user_profile.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

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
                UserProfile(),
                HorizontalSpace(7),
                IconButton(
                  onPressed: () {},
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
  const SimpleAppBar({super.key, required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                onPressed: () {},
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
