import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/fav_meals_view/widgets/fav_meals_card.dart';

class FavMealsViewBody extends StatelessWidget {
  const FavMealsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavMealsCubit, FavMealsState>(
      builder: (context, state) {
        if (state is FavMealsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavMealsLoaded) {
          final items = state.items;
          return GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(4),
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.99,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GestureDetector(
                child: FavMealsCard(
                  item: item,
                  onPressed: () async {
                    await context.read<FavMealsCubit>().removeMeal(item);
                  },
                ),
              );
            },
          );
        } else if (state is FavError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text('Your Fav list is empty'));
        }
      },
    );
  }
}
