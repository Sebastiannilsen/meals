import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
    this.title,
    required this.allMeals,
  }) : super(key: key);

  final List<Meal> allMeals;
  final String? title;

  @override
  State<SearchScreen> createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
    displayedMeals = widget.allMeals; // Initialize with all meals
  }

  // Function to navigate to the details screen when a meal is selected.
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  // Function to filter meals based on the search criteria.
  void filterMeals(String searchTerm) {
    setState(() {
      displayedMeals = widget.allMeals
          .where((meal) =>
              meal.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onSearch: filterMeals,
        ),
      ),
      body: displayedMeals.isNotEmpty
          ? ListView.builder(
              itemCount: displayedMeals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: displayedMeals[index],
                onSelectMeal: (meal) {
                  selectMeal(context, meal);
                },
              ),
            )
          : const Center(
              child: Text(
                'No meals match your search.',
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                ),
              ),
            ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final void Function(String) onSearch;

  const SearchBar({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<SearchBar> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          labelText: 'Search for Meals',
          prefixIcon: Icon(Icons.search),
        ),
        style: const TextStyle(
            color: Colors.white), // Set the input text color to white
        onChanged: (searchTerm) {
          // Notify the parent widget of the search term.
          widget.onSearch(searchTerm);
        },
      ),
    );
  }
}
