import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/data/repos/cart_repo_impl.dart';
import 'package:meal_planning_app/features/home/domain/services/cart_services.dart';
import 'package:meal_planning_app/features/home/domain/usecases/calculate_cart_calorie_and_price_use_case.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCartRepository extends Mock implements CartRepoImpl {}

void main() {
  late CartCubit cartCubit;
  late MockCartRepository mockRepository;

  setUp(() {
    mockRepository = MockCartRepository();
    cartCubit = CartCubit(
      repo: mockRepository,
      calculateCalorieAndPriceUsecase: CalculateCartCalorieAndPriceUseCase(
        services: CartServices(),
      ),
    );
  });

  tearDown(() {
    cartCubit.close();
  });

  test('initial state should be CartLoading', () {
    expect(cartCubit.state, isA<CartLoading>());
  });

  group('Cart Cubit (getCartData) Tests', () {
    blocTest<CartCubit, CartState>(
      'should emit [Loading, Loaded] when data is fetched successfully',
      build: () {
        when(() => mockRepository.getCartData()).thenAnswer(
          (_) async => Right(<CartItemModel>[
            CartItemModel(
              name: 'Green Beans',
              price: 1,
              quantity: 1,
              imageUrl:
                  'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
              calories: 25,
              weight: '100g',
            ),
          ]),
        );
        return cartCubit;
      },
      act: (cubit) => cubit.getCartItems(),
      expect: () => [isA<CartLoading>(), isA<CartLoaded>()],
    );

    blocTest<CartCubit, CartState>(
      'should emit [Loading, Empty] when data is fetched successfully',
      build: () {
        when(
          () => mockRepository.getCartData(),
        ).thenAnswer((_) async => Right(<CartItemModel>[]));
        return cartCubit;
      },
      act: (cubit) => cubit.getCartItems(),
      expect: () => [isA<CartLoading>(), isA<CartEmpty>()],
    );

    blocTest<CartCubit, CartState>(
      'should emit [Loading, Error] when fetching fails',
      build: () {
        when(
          () => mockRepository.getCartData(),
        ).thenAnswer((_) async => Left(Exception('Failed to fetch')));
        return cartCubit;
      },
      act: (cubit) => cubit.getCartItems(),
      expect: () => [isA<CartLoading>(), isA<CartError>()],
    );
  });

  group('Cart Cubit (addItem) Tests', () {
    blocTest<CartCubit, CartState>(
      'should emit [Loading, Loaded] when fetching Success',
      build: () {
        final cartItem = CartItemModel(
          name: 'Apple',
          price: 1,
          imageUrl:
              'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
        );
        when(() => mockRepository.addItemToCart(cartItem)).thenAnswer(
          (_) async => Right(<CartItemModel>[
            CartItemModel(
              name: 'Green Beans',
              price: 1,
              quantity: 1,
              imageUrl:
                  'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
              calories: 25,
              weight: '100g',
            ),
            CartItemModel(
              name: 'Green Beans',
              price: 1,
              quantity: 1,
              imageUrl:
                  'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
            ),
          ]),
        );
        return cartCubit;
      },
      act:
          (cubit) => cubit.addItem(
            GrocerryItemModel(
              name: 'Apple',
              price: 1,
              imageUrl:
                  'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
              category: 'fruits',
            ),
          ),
      expect: () => [isA<CartLoading>(), isA<CartError>()],
    );

    blocTest<CartCubit, CartState>(
      'should emit [Loading, Error] when fetching fails',
      build: () {
        final cartItem = CartItemModel(
          name: 'Apple',
          price: 1,
          imageUrl:
              'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
        );
        when(
          () => mockRepository.addItemToCart(cartItem),
        ).thenAnswer((_) async => Left(Exception('Failed to fetch')));
        return cartCubit;
      },
      act:
          (cubit) => cubit.addItem(
            GrocerryItemModel(
              name: 'Apple',
              price: 1,
              imageUrl:
                  'https://i.pinimg.com/736x/de/63/91/de63915e7675796fa93d09e380fae34c.jpg',
              category: 'fruits',
            ),
          ),
      expect: () => [isA<CartLoading>(), isA<CartError>()],
    );
  });
}
