import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/onBoarding/presentation/on_boarding_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
    goToNextView();
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
        VerticalSpace(25),
        Center(
          child: SizedBox(
            height: SizeConfig.defaultSize! * 30,
            child: Lottie.asset('assets/animations/Food animation.json'),
          ),
        ),
        FadeTransition(
          opacity: fadingAnimation!,
          child: Text(
            'PlaniShop',
            style: TextStyle(
              fontSize: 42,
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void goToNextView() {
    Future.delayed(Duration(seconds: 5), () {
      Get.to(() => OnBoardingView(), transition: Transition.fade);
    });
  }
}
