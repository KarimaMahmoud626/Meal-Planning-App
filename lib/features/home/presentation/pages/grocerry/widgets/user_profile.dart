import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_title_subtitle.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/user_avatar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(),
        CustomTitleSubtitle(
          title: 'Karima',
          subTitle: 'elnadykarima@gmail.com',
          titleColor: Color(0xFFFFFFFF),
          subTitleColor: Color(0xFFFFFFFF),
        ),
      ],
    );
  }
}
