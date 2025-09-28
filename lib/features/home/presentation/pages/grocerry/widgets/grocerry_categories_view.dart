import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/category_button.dart';

class GrocerryCategoriesView extends StatefulWidget {
  const GrocerryCategoriesView({super.key});

  @override
  State<GrocerryCategoriesView> createState() => _GrocerryCategoriesViewState();
}

class _GrocerryCategoriesViewState extends State<GrocerryCategoriesView> {
  int buttonIndex = 0;
  List<String> categoryImageList = [
    'assets/images/vegetables.jpg',
    'assets/images/fruits.jpeg',
    'assets/images/drinks.jpeg',
    'assets/images/milk.jpeg',
    'assets/images/bread.jpeg',
    'assets/images/protein.jpeg',
  ];
  List<String> categoryNameList = [
    'Vegetables',
    'Fruits',
    'Drinks',
    'Milk&Egg',
    'Bread',
    'Animal Protein',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 14,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap: () {
                buttonIndex = index;
                setState(() {});
              },
              child: CategoryButton(
                isPicked: buttonIndex == index,
                categoryName: categoryNameList[index],
                image: categoryImageList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
