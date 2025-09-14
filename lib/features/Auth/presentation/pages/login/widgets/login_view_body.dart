import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/compelete_information_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(20),
        Center(
          child: SizedBox(
            height: SizeConfig.defaultSize! * 25,
            width: SizeConfig.defaultSize! * 25,
            child: Image.asset(kLogoImage),
          ),
        ),
        Text(
          'PlaniShop',
          style: TextStyle(
            fontSize: 42,
            color: kMainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomLoginWithButton(
                  onTap: () {
                    Get.to(
                      () => CompeleteInformationView(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.rightToLeft,
                    );
                  },
                  text: 'Login with',
                  iconColor: Color(0xFFdb3236),
                  icon: FontAwesomeIcons.googlePlusG,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomLoginWithButton(
                  onTap: () {
                    Get.to(
                      () => CompeleteInformationView(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.rightToLeft,
                    );
                  },
                  text: 'Login with',
                  iconColor: Color(0xFF4267B2),
                  icon: FontAwesomeIcons.facebookF,
                ),
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
