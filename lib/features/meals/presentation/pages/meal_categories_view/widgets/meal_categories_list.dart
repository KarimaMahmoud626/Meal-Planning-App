import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as getx;
import 'package:meal_planning_app/features/meals/presentation/pages/meals_view/meals_view.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/widgets/meal_category_button.dart';

class MealCategoriesList extends StatelessWidget {
  MealCategoriesList({super.key, this.numberOfCategories = 13});

  final int? numberOfCategories;

  final List<String> categoryImageList = [
    'https://i.pinimg.com/736x/41/b2/c6/41b2c6ae404d870a60b8272af91da59f.jpg',
    'https://i.pinimg.com/1200x/07/86/e9/0786e9857f767af9c7521487e497c4e5.jpg',
    'https://i.pinimg.com/1200x/7d/e5/b0/7de5b0856d4ef5fbac9af923695f261a.jpg',
    'https://i.pinimg.com/1200x/94/64/74/94647412c889b23cafd067143750d4ed.jpg',
    'https://i.pinimg.com/1200x/e8/44/ec/e844ec69536457f4abe0d00cc4aaea2d.jpg',
    'https://i.pinimg.com/736x/8f/c6/3e/8fc63ecde415fc7e8119ee2b46c07be9.jpg',
    'https://i.pinimg.com/1200x/f2/55/b9/f255b9bb08d22f8f05ffba417ef1a7da.jpg',
    'https://i.pinimg.com/1200x/55/69/92/55699222d5461ae11a4524628a778a32.jpg',
    'https://i.pinimg.com/1200x/aa/fe/75/aafe75951ebec3d8224e84d945ab999a.jpg',
    'https://i.pinimg.com/1200x/fd/9b/2e/fd9b2e5235c42983e5983a0018533d6f.jpg',
    'https://i.pinimg.com/1200x/f1/f1/f6/f1f1f6055075c0fe268455ba7f958b36.jpg',
    'https://i.pinimg.com/736x/7c/a7/50/7ca75002b5b474fab3e2add409605b2f.jpg',
    'https://i.pinimg.com/736x/cf/3c/24/cf3c248c62c29dea715bab50e901cd33.jpg',
  ];
  final List<String> categoryNameList = [
    'Beef',
    'Chicken',
    'Dessert',
    'Lamb',
    'Miscellaneous',
    'Pasta',
    'Pork',
    'Seafood',
    'Side',
    'Starter',
    'Vegan',
    'Vegetarian',
    'Breakfast',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(4),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.9,
      ),
      itemCount: numberOfCategories,
      itemBuilder: (context, index) {
        return MealCategoryButton(
          onPressed: () {
            Get.to(
              () => MealsView(categoryName: categoryNameList[index]),
              duration: const Duration(milliseconds: 500),
              transition: getx.Transition.rightToLeft,
            );
          },
          categoryName: categoryNameList[index],
          categoryImageUrl: categoryImageList[index],
        );
      },
    );
  }
}
