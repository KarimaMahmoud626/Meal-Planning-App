import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/navigation_helper.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginWithGoogleSuccess) {
          print(state);
          if (state.isNew!) {
            NavigationHelper.toCompleteInfo(context, replace: true);
          } else {
            NavigationHelper.toMain(context, replace: true, user: state.user!);
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
