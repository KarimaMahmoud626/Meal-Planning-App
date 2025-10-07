import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/manager/cubit/counter_cubit.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';

class IntCounter extends StatelessWidget {
  const IntCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Row(
            spacing: 8,
            children: [
              CustomIconButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                icon: Icons.add,
                iconColor: Color(0xFFFFFFFF),
                buttonColor: kMainColor,
              ),
              Text(state.counter.toString(), style: TextStyle(fontSize: 16)),
              CustomIconButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                icon: Icons.remove,
                iconColor: Color(0xFFFFFFFF),
                buttonColor: kMainColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
