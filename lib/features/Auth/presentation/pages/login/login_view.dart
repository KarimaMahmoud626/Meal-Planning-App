import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/add_new_user_usecase.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/get_user_data_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/login_with_facebook_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/login_with_google_use_case.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AuthCubit(
            loginWithGoogleUseCase: LoginWithGoogleUseCase(AuthRepoImpl()),
            loginWithFacebookUseCase: LoginWithFacebookUseCase(AuthRepoImpl()),
            addNewUserUsecase: AddNewUserUsecase(repo: AuthRepoImpl()),
            getUserDataUseCase: GetUserDataUseCase(AuthRepoImpl()),
          ),
      child: Scaffold(backgroundColor: Colors.white, body: LoginViewBody()),
    );
  }
}
