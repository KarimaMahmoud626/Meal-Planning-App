import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/bottom_nav_bar.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/core/widgets/text_row.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    super.key,
    this.totalPrice,
    this.totalCalories,
    this.isLoadded = true,
    this.progress,
  });
  final double? totalPrice;
  final double? totalCalories;
  final bool? isLoadded;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.19,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            isLoadded!
                ? Column(
                  children: [
                    VerticalSpace(1.5),
                    TextRow(
                      headText: 'Total Price:',
                      valueText: '\$$totalPrice',
                    ),
                    TextRow(
                      headText: 'Total Calories:',
                      valueText: '$totalCalories cal',
                    ),
                    VerticalSpace(0.5),
                    SizedBox(
                      height: 40,
                      width: SizeConfig.screenWidth! * 0.7,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is GetUserDataSuccess) {
                            final percent =
                                totalCalories! / state.user.neededCalories!;
                            return CustomAnimatedButton(
                              text: 'Confirm',
                              val: percent,
                              onTap: () {
                                if (percent >= 0.7) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.success,
                                    animType: AnimType.rightSlide,
                                    title: 'Order Confirmed',
                                    btnOkOnPress:
                                        () =>
                                            Get.to(() => BottomNavContainer()),
                                  ).show();
                                  context.read<CartCubit>().removeAll();
                                }
                              },
                            );
                          } else {
                            return CustomAnimatedButton(
                              text: 'Confirm',
                              val: 0,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )
                : Column(
                  children: [
                    Center(child: CircularProgressIndicator()),
                    SizedBox(
                      height: 40,
                      width: SizeConfig.screenWidth! * 0.7,
                      child: CustomAnimatedButton(text: 'Confirm', val: 0),
                    ),
                  ],
                ),
      ),
    );
  }
}
