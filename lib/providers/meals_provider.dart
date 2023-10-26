import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/dummy_data.dart';

// Create a Provider to provide a list of meals.
final mealsProvider = Provider((ref) {
  // Return the list of meals from a data source, in this case, it's referred to as dummyMeals.
  return dummyMeals;
});
