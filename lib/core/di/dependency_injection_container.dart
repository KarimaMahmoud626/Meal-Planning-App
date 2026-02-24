import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:meal_planning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';
import 'package:meal_planning_app/features/Auth/domain/services/calorie_calculator.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/add_new_user_usecase.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/calculate_calorie_usecase.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/compelete_info_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/get_user_data_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/login_with_facebook_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/login_with_google_use_case.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/home/data/repos/cart_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/repos/fav_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/repos/grocerry_items_repo_impl.dart';
import 'package:meal_planning_app/features/home/domain/repos/cart_repo.dart';
import 'package:meal_planning_app/features/home/domain/repos/fav_repo.dart';
import 'package:meal_planning_app/features/home/domain/repos/grocerry_items_repo.dart';
import 'package:meal_planning_app/features/home/domain/services/cart_services.dart';
import 'package:meal_planning_app/features/home/domain/usecases/calculate_cart_calorie_and_price_use_case.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/data/repos/meal_planner_repo_impl.dart';
import 'package:meal_planning_app/features/meal_planner/domain/repos/meal_planner_repo.dart';
import 'package:meal_planning_app/features/meal_planner/domain/usecases/get_week_plan_usecase.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meals/data/repos/fav_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/data/repos/meal_nutrition_repo_impl.dart';
import 'package:meal_planning_app/features/meals/data/repos/suggested_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/domain/repos/fav_meal_repo.dart';
import 'package:meal_planning_app/features/meals/domain/repos/meal_nutrition_repo.dart';
import 'package:meal_planning_app/features/meals/domain/repos/search_meal_repo.dart';
import 'package:meal_planning_app/features/meals/domain/repos/suggested_meal_repo.dart';
import 'package:meal_planning_app/features/meals/data/repos/search_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/domain/usecases/search_meal_use_case.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/nutrition_cubit/cubit/nutrition_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => GoogleSignIn());
  getIt.registerLazySingleton(() => FacebookAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());

  getIt.registerLazySingleton(() => CalorieCalculator());

  getIt.registerLazySingleton(
    () => CalculateCalorieUsecase(calculator: getIt<CalorieCalculator>()),
  );
  getIt.registerLazySingleton(() => AddNewUserUsecase(repo: getIt<AuthRepo>()));
  getIt.registerLazySingleton(() => CompeleteInfoUseCase(getIt<AuthRepo>()));
  getIt.registerLazySingleton(() => GetUserDataUseCase(getIt<AuthRepo>()));
  getIt.registerLazySingleton(() => LoginWithGoogleUseCase(getIt<AuthRepo>()));
  getIt.registerLazySingleton(
    () => LoginWithFacebookUseCase(getIt<AuthRepo>()),
  );

  getIt.registerFactory(
    () => AuthCubit(
      calculateCalorieUsecase: getIt<CalculateCalorieUsecase>(),
      addNewUserUsecase: getIt<AddNewUserUsecase>(),
      completeInformationUseCase: getIt<CompeleteInfoUseCase>(),
      getUserDataUseCase: getIt<GetUserDataUseCase>(),
      loginWithGoogleUseCase: getIt<LoginWithGoogleUseCase>(),
      loginWithFacebookUseCase: getIt<LoginWithFacebookUseCase>(),
    ),
  );

  getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl());

  getIt.registerLazySingleton(() => CartServices());

  getIt.registerLazySingleton(
    () => CalculateCartCalorieAndPriceUseCase(services: getIt<CartServices>()),
  );

  getIt.registerFactory(
    () => CartCubit(
      repo: getIt<CartRepo>(),
      calculateCalorieAndPriceUsecase:
          getIt<CalculateCartCalorieAndPriceUseCase>(),
    ),
  );

  getIt.registerLazySingleton<FavRepo>(
    () => FavRepoImpl(getIt<FirebaseFirestore>()),
  );

  getIt.registerFactory(() => FavouriteCubit(repo: getIt<FavRepo>()));

  getIt.registerLazySingleton<GrocerryItemsRepo>(
    () => FetchGrocerryItemsRepoImpl(getIt<FirebaseFirestore>()),
  );

  getIt.registerFactory(
    () => GrocerryItemsCubit(repo: getIt<GrocerryItemsRepo>()),
  );

  getIt.registerLazySingleton<FavMealRepo>(
    () => FavMealRepoImpl(getIt<FirebaseFirestore>()),
  );

  getIt.registerFactory(() => FavMealsCubit(getIt<FavMealRepo>()));

  getIt.registerLazySingleton<MealNutritionRepo>(() => MealNutritionRepoImpl());

  getIt.registerFactory(() => NutritionCubit(repo: getIt<MealNutritionRepo>()));

  getIt.registerLazySingleton<SuggestedMealRepo>(() => SuggestedMealRepoImpl());
  getIt.registerLazySingleton<SearchMealRepo>(() => SearchMealRepoImpl());
  getIt.registerLazySingleton(() => SearchMealUseCase());

  getIt.registerFactory(
    () => MealsCubit(
      repo: getIt<SuggestedMealRepo>(),
      searchMealUseCase: getIt<SearchMealUseCase>(),
    ),
  );

  getIt.registerLazySingleton<MealPlannerRepo>(() => MealPlannerRepoImpl());
  getIt.registerLazySingleton(
    () => GetWeekPlanUsecase(repo: getIt<MealPlannerRepo>()),
  );

  getIt.registerFactory(
    () => PlannerCubit(getWeekPlanUsecase: getIt<GetWeekPlanUsecase>()),
  );
}

Future<void> resetDependencies() async {
  await getIt.reset();
}
