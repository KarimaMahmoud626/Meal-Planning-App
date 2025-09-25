import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/custom_dots_indicator.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/login/login_view.dart';
import 'package:meal_planning_app/features/onBoarding/presentation/widgets/custom_page_view.dart';
import 'package:get/get.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(pageController: pageController),
        Positioned(
          bottom: SizeConfig.defaultSize! * 23,
          left: 0,
          right: 0,
          child: CustomDotsIndicator(
            position: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Visibility(
          visible:
              pageController!.hasClients
                  ? (pageController!.page == 3 ? false : true)
                  : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 10,
            right: 32,
            child: TextButton(
              onPressed: () {
                if (pageController!.page! < 3) {
                  pageController!.jumpToPage(3);
                }
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xff898989),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 10,
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          child: CustomGeneralButton(
            onTap: () {
              if (pageController!.page! < 3) {
                pageController?.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                Get.to(
                  () => LoginView(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 500),
                );
              }
            },
            text:
                pageController!.hasClients
                    ? pageController!.page == 3
                        ? 'Get Started'
                        : 'Next'
                    : 'Next',
          ),
        ),
      ],
    );
  }
}
