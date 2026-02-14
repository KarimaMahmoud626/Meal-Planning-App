import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/navigation_helper.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    fadingAnimation = Tween<double>(
      begin: 0.2,
      end: 1,
    ).animate(animationController!);
    animationController?.repeat(reverse: true);
    goToNextView(context);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Spacer(),
        FadeTransition(
          opacity: fadingAnimation!,
          child: Image.asset('assets/images/app_logo.png'),
        ),
        Spacer(),
      ],
    );
  }

  void goToNextView(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      NavigationHelper.toOnboarding(context);
    });
  }
}
