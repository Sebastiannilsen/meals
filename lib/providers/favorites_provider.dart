import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/models/meal.dart';

// Define a notifier for managing favorite meals using Riverpod.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // Initialize with an empty list.

  // Toggle the favorite status of a meal and return true if it's added as a favorite, false if removed.
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // If the meal is already a favorite, remove it from the list.
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // If the meal is not a favorite, add it to the list.
      state = [...state, meal];
      return true;
    }
  }
}

// Create a StateNotifierProvider for FavoriteMealsNotifier.
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
