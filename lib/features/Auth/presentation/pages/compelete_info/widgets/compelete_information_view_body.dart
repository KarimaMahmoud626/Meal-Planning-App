import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:meal_planning_app/core/widgets/custom_buttons.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_planning_app/features/Auth/domain/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/widgets/compelete_info_item.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/home_view.dart';

class CompeleteInformationViewBody extends StatefulWidget {
  const CompeleteInformationViewBody({super.key});

  @override
  State<CompeleteInformationViewBody> createState() =>
      _CompeleteInformationViewBodyState();
}

class _CompeleteInformationViewBodyState
    extends State<CompeleteInformationViewBody> {
  AuthRepoImpl? authRepo;
  String? name, phoneNumber, address;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CompeleteInfoSuccess) {
          Get.to(
            () => HomeView(),
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
                  CompeleteInfoItem(
                    text: 'Enter Your Name',
                    onSaved: (value) {
                      name = value;
                    },
                    icon: Icons.supervised_user_circle,
                  ),
                  VerticalSpace(2),
                  CompeleteInfoItem(
                    text: 'Enter Your Phone Number',
                    onSaved: (value) {
                      phoneNumber = value;
                    },
                    icon: Icons.phone,
                  ),
                  VerticalSpace(2),
                  CompeleteInfoItem(
                    text: 'Enter Your Address',
                    onSaved: (value) {
                      address = value;
                    },
                    maxLines: 5,
                    icon: Icons.location_on,
                  ),
                  VerticalSpace(5),
                  CustomLoginButton(
                    isLoading: state is AuthLoading ? true : false,
                    onTap: () {
                      final currentUser = FirebaseAuth.instance.currentUser!;
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var userModel = UserModel(
                          email: currentUser.email,
                          name: name,
                          phoneNumber: phoneNumber,
                          address: address,
                        );
                        context.read<AuthCubit>().compeleteInformation(
                          userModel,
                          name ?? '',
                          phoneNumber ?? '',
                          address ?? '',
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
