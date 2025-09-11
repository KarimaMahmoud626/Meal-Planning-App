import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/onBoarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: OnBoardingBody());
  }
}
