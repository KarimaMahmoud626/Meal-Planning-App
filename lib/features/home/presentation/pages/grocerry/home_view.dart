import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeViewBody(),
      appBar: CustomAppBar(user: user),
    );
  }
}
