import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/cart_items_list.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        context.read<CartCubit>().getCartItems();
        if (state is CartLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CartLoaded) {
          final items = state.items;
          return SingleChildScrollView(
            child: Column(
              children: [
                CartItemsList(items: items),
                SizedBox(height: SizeConfig.screenHeight! * 0.2),
              ],
            ),
          );
        } else if (state is CartError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is CartEmpty) {
          return Center(child: Text('Your Cart is Empty'));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }
}
