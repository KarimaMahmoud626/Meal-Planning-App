import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/onBoarding/presentation/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, @required this.pageController});

  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          title: 'Welcome to PlaniShop',
          subTitle: 'Plan meals & shop smarter in one place.',
          image: 'assets/images/onboarding1.jpg',
        ),
        PageViewItem(
          title: 'Smart Grocery Lists',
          subTitle:
              'Add ingredients and automatically \n save them in an organized list.',
          image: 'assets/images/onboarding2.jpg',
        ),
        PageViewItem(
          title: 'Daily Meal Suggestions',
          subTitle: 'Discover new recipes tailored to your taste and schedule.',
          image: 'assets/images/onboarding3.jpg',
        ),
        PageViewItem(
          title: 'Plan Your Weekly Meals',
          subTitle: 'Waste less food and stay organized.',
          image: 'assets/images/onboarding4.jpg',
        ),
      ],
    );
  }
}
