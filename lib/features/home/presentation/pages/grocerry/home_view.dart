import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(body: HomeViewBody(), appBar: CustomAppBar());
  }
}
