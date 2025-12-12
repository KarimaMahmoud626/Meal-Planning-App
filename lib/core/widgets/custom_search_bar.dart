import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/suggested_meals/widgets/meal_search_card.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late SearchController controller;
  List meals = [];

  @override
  void initState() {
    super.initState();
    controller = SearchController();
    controller.addListener(() async {
      final value = controller.text;

      if (value.isEmpty) return;

      context.read<MealsCubit>().searchMeals(value);
      if (!controller.isOpen) controller.openView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocListener<MealsCubit, MealsState>(
        listener: (BuildContext context, state) {
          if (state is SearchMealsLoaded) {
            setState(() => meals = state.meals); // تحديث محلي فقط
          }
        },
        child: SearchAnchor(
          viewBackgroundColor: Colors.white,
          searchController: controller,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              hintText: 'Search for meals...',
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 12),
              ),
              shape: WidgetStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
              constraints: BoxConstraints(minHeight: 48, maxHeight: 48),
              onTap: () async {
                print("on tap");
                await context.read<MealsCubit>().getSuggestedMeals(5);
                controller.openView();
              },
              onChanged: (value) async {
                print("entring on changed");
                await context.read<MealsCubit>().searchMeals(value);
                controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, weight: 3),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              ],
            );
          },
          suggestionsBuilder: (context, controller) {
            if (meals.isEmpty) {
              return [Center(child: Text("No results"))];
            }

            return meals.map((meal) => MealSearchCard(meal: meal)).toList();
          },
        ),
      ),
    );
  }
}
