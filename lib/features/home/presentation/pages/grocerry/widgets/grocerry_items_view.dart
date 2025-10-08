import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/data/repos/grocerry_items_repo_impl.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/grocerry_item_card.dart';

class GrocerryItemsView extends StatelessWidget {
  GrocerryItemsView({super.key});

  final repo = FetchGrocerryItemsRepoImpl(FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrocerryItemsCubit, GrocerryItemsState>(
      builder: (context, state) {
        if (state is GrocerryItemsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GrocerryItemsLoaded) {
          final items = state.items;
          return GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(4),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.9,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GrocerryItemCard(item: item);
            },
          );
        } else if (state is GrocerryItemsError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text('Select a category'));
        }
      },
    );
  }
}
