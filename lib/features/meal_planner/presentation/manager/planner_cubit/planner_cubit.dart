import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meal_planner/domain/usecases/get_week_plan_usecase.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_state.dart';

class PlannerCubit extends Cubit<PlannerState> {
  final GetWeekPlanUsecase? getWeekPlanUsecase;
  PlannerCubit({this.getWeekPlanUsecase}) : super(PlannerLoading());

  Future<void> getWeekPlan() async {
    try {
      emit(PlannerLoading());
      print('planner cubit');
      final result = await getWeekPlanUsecase!.call();
      print('result got $result');
      result.fold(
        (ex) {
          emit(PlannerFailure(ex.toString()));
          print(ex.toString());
        },
        (plan) {
          emit(PlannerLoadded(planModel: plan));
          print('planner data $plan');
        },
      );
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}
