import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/core/widgets/user_avatar.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(),
        CustomTitleSubtitle(
          title: user.name,
          subTitle: '${user.neededCalories} cal for today',
          titleColor: Color(0xFFFFFFFF),
          subTitleColor: Color(0xFFFFFFFF),
        ),
      ],
    );
  }
}
