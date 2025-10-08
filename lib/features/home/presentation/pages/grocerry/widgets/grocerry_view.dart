import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_categories_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_items_view.dart';

class GrocerryView extends StatelessWidget {
  const GrocerryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GrocerryItemsCubit(),
      child: Column(children: [GrocerryCategoriesView(), GrocerryItemsView()]),
    );
  }
}
