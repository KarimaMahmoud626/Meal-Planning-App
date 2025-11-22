import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_planning_app/features/Auth/domain/services/calorie_calculator.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/calculate_calorie_usecase.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/compelete_info_use_case.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/widgets/compelete_information_view_body.dart';

class CompeleteInformationView extends StatelessWidget {
  const CompeleteInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AuthCubit(
            completeInformationUseCase: CompeleteInfoUseCase(AuthRepoImpl()),
            calculateCalorieUsecase: CalculateCalorieUsecase(
              calculator: CalorieCalculator(),
            ),
          ),
      child: Scaffold(
        body: CompeleteInformationViewBody(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
