import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: CircleAvatar(
        radius: SizeConfig.defaultSize! * 3,
        backgroundImage: AssetImage("assets/images/default_avatar.jpeg"),
      ),
    );
  }
}
