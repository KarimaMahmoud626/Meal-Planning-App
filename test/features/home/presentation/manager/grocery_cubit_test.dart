import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/home/data/repos/grocerry_items_repo_impl.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGroceryRepository extends Mock
    implements FetchGrocerryItemsRepoImpl {}

void main() {
  late GrocerryItemsCubit groceryCubit;
  late MockGroceryRepository mockRepository;

  setUp(() {
    mockRepository = MockGroceryRepository();
    groceryCubit = GrocerryItemsCubit(repo: mockRepository);
  });

  tearDown(() {
    groceryCubit.close();
  });

  test('initial state should be GroceryLoading', () {
    // Assert
    expect(groceryCubit.state, isA<GrocerryItemsLoading>());
  });

  blocTest<GrocerryItemsCubit, GrocerryItemsState>(
    'should emit [Loading, Success] when data is fetched successfully',
    build: () {
      when(
        () => mockRepository.getGrocerryData('vegetables'),
      ).thenAnswer((_) async => Right(<GrocerryItemModel>[]));
      return groceryCubit;
    },
    act: (cubit) => cubit.getGrocerryItems('vegetables'),
    expect: () => [isA<GrocerryItemsLoading>(), isA<GrocerryItemsLoaded>()],
  );

  blocTest<GrocerryItemsCubit, GrocerryItemsState>(
    'should emit [Loading, Error] when fetching fails',
    build: () {
      // هنا بنقول: لما يطلب data، ارمي error
      when(
        () => mockRepository.getGrocerryData('vegetables'),
      ).thenAnswer((_) async => Left(Exception('Failed to fetch')));
      return groceryCubit;
    },
    act: (cubit) => cubit.getGrocerryItems('vegetables'),
    expect: () => [isA<GrocerryItemsLoading>(), isA<GrocerryItemsError>()],
  );
}
