import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/core/widgets/user_avatar.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    this.userName = 'Karima',
    this.phoneNumber = '000',
  });

  final String userName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, state) {
        if (state is AuthLoading) {
          return CircularProgressIndicator();
        } else if (state is GetUserDataSuccess) {
          return Row(
            children: [
              UserAvatar(),
              CustomTitleSubtitle(
                title: state.user.name,
                subTitle: '${state.user.neededCalories} kcal for today',
                titleColor: Color(0xFFFFFFFF),
                subTitleColor: Color(0xFFFFFFFF),
              ),
            ],
          );
        } else if (state is AuthFailure) {
          return Text(state.message.toString());
        } else {
          return Text('not available');
        }
      },
    );
  }
}
