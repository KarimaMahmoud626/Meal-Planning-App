import 'package:flutter/material.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: LoginViewBody());
  }
}
