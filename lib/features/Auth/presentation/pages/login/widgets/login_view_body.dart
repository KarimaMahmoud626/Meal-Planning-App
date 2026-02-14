import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/bottom_nav_bar.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/compelete_information_view.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginWithGoogleSuccess) {
          print(state);
          if (state.isNew!) {
            Get.to(
              () => BlocProvider.value(
                value: context.read<AuthCubit>(),
                child: CompeleteInformationView(),
              ),
              duration: const Duration(milliseconds: 500),
              transition: getx.Transition.rightToLeft,
            );
          } else {
            Get.to(
              () => BottomNavContainer(),
              duration: const Duration(milliseconds: 500),
              transition: getx.Transition.rightToLeft,
            );
          }
        } else if (state is AuthFailure) {
          print(state.message);
        }
      },
      builder: (context, state) {
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
                      onTap: () async {
                        print('before google sign in');
                        final authCubit = context.read<AuthCubit>();
                        await authCubit.loginWithGoogle();
                        print('after google sign in');
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
                      onTap: () async {
                        print('before f');
                        final authCubit = context.read<AuthCubit>();
                        await authCubit.loginWithFacebook();
                        print('after facebook');
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
      },
    );
  }
}
