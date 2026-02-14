import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/core/widgets/custom_search_bar.dart';
import 'package:meal_planning_app/core/widgets/user_profile.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/plan_view.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/fav_meals_view/fav_meals_view.dart';

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
                Spacer(),
                IconButton(
                  onPressed: () {
                    Get.to(
                      () => BlocProvider.value(
                        value: context.read<PlannerCubit>(),
                        child: PlanView(),
                      ),
                      duration: Duration(milliseconds: 500),
                      transition: getx.Transition.leftToRight,
                    );
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
                      Get.back();
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
                      Get.to(
                        () => FavMealsView(),
                        duration: Duration(milliseconds: 500),
                        transition: getx.Transition.rightToLeft,
                      );
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
                      Get.back();
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
