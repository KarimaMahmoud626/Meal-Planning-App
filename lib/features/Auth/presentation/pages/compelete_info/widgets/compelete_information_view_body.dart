import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/widgets/compelete_info_item.dart';
import 'package:meal_planning_app/core/widgets/bottom_nav_bar.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/widgets/custom_drop_down_list.dart';

class CompeleteInformationViewBody extends StatefulWidget {
  const CompeleteInformationViewBody({super.key});

  @override
  State<CompeleteInformationViewBody> createState() =>
      _CompeleteInformationViewBodyState();
}

class _CompeleteInformationViewBodyState
    extends State<CompeleteInformationViewBody> {
  String? gender;
  num? age, height, weight;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CompeleteInfoSuccess) {
          Get.to(
            () => BottomNavContainer(),
            duration: Duration(milliseconds: 500),
            transition: getx.Transition.rightToLeft,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  VerticalSpace(10),
                  CustomDropDownList(
                    icon: Icons.person,
                    text: 'Select your gender',
                    hint: 'choose gender...',
                    items: const [
                      DropdownMenuItem(value: 'Female', child: Text('Female')),
                      DropdownMenuItem(value: 'Male', child: Text('Male')),
                    ],
                    onChanged: (value) {
                      gender = value;
                    },
                    validator: (value) {
                      if (value == null) return 'Gender is required';
                      return null;
                    },
                  ),
                  VerticalSpace(2),
                  CompeleteInfoItem(
                    text: 'Enter Your Height (cm)',
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      height = num.tryParse(value ?? "") ?? 0;
                    },
                    icon: FontAwesomeIcons.ruler,
                    validator:
                        (value) =>
                            value == null || value.isEmpty ? "Required" : null,
                  ),
                  VerticalSpace(2),
                  CompeleteInfoItem(
                    text: 'Enter Your Weight (kgm)',
                    onSaved: (value) {
                      weight = num.tryParse(value ?? "") ?? 0;
                    },
                    icon: Icons.scale,
                    validator:
                        (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                  ),
                  VerticalSpace(2),
                  CompeleteInfoItem(
                    text: 'Enter Your Age',
                    onSaved: (value) {
                      age = num.tryParse(value ?? "") ?? 0;
                    },
                    icon: FontAwesomeIcons.clock,
                    validator:
                        (value) =>
                            value == null || value.isEmpty ? 'Required' : null,
                  ),
                  VerticalSpace(5),
                  CustomLoginButton(
                    isLoading: state is AuthLoading ? true : false,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.read<AuthCubit>().compeleteInformation(
                          gender: gender,
                          height: height,
                          weight: weight,
                          age: age,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
