import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/providers/meals_provider.dart';

// Define an enum to represent different filtering options.
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

// Create a FiltersNotifier for managing filtering state.
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  // Set the chosen filters to the state.
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  // Set an individual filter to be active or inactive.
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

// Create a StateNotifierProvider for FiltersNotifier.
final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

// Create a Provider for filtered meals based on active filters.
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  // Filter meals based on the active filters.
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
