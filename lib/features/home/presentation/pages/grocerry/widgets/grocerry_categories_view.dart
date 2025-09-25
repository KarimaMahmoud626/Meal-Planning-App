import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/category_button.dart';

class GrocerryCategoriesView extends StatelessWidget {
  const GrocerryCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryButton(
            onTap: () {},
            categoryName: 'Vegetables',
            image: 'assets/images/vegetables.jpg',
          ),
          CategoryButton(
            categoryName: 'Fruits',
            image: 'assets/images/fruits.jpeg',
          ),
          CategoryButton(
            categoryName: 'Drinks',
            image: 'assets/images/drinks.jpeg',
          ),
          CategoryButton(
            categoryName: 'Milk&Eggs',
            image: 'assets/images/milk.jpeg',
          ),
          CategoryButton(
            categoryName: 'Bread',
            image: 'assets/images/bread.jpeg',
          ),
          CategoryButton(
            categoryName: 'Animal Protein',
            image: 'assets/images/protein.jpeg',
          ),
        ],
      ),
    );
  }
}
