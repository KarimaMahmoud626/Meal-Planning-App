import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/cart_bottom_sheet.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/widgets/cart_view_body.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: CartViewBody(),
      bottomSheet: BottomSheet(
        enableDrag: false,
        backgroundColor: Colors.grey.shade100,
        shadowColor: Colors.black,
        onClosing: () {},
        builder: (context) {
          return BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return CartBottomSheet(isLoadded: false);
              } else if (state is CartLoaded) {
                return CartBottomSheet(
                  isLoadded: true,
                  totalCalories: state.totalCalories,
                  totalPrice: state.totalPrice,
                  progress: (state.totalCalories! / 1405.25),
                );
              } else {
                return Center(child: Text('Something went Wrong'));
              }
            },
          );
        },
      ),
    );
  }
}
