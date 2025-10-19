import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/favorites/widgets/fav_items_list.dart';

class FavoriteItemsViewBody extends StatelessWidget {
  const FavoriteItemsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (BuildContext context, FavouriteState state) {
        if (state is FavLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FavLoaded) {
          final items = state.items;
          return FavItemsList(items: items);
        } else if (state is FavError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is FavEmpty) {
          return Center(child: Text('Your Cart is Empty'));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }
}
