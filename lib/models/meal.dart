// Enum to represent the complexity level of a meal.
enum Complexity {
  simple, // Easy to prepare.
  challenging, // Requires some cooking skills.
  hard, // A more complex recipe.
}

// Enum to represent the affordability of a meal.
enum Affordability {
  affordable, // Inexpensive.
  pricey, // Moderately expensive.
  luxurious, // High-end or luxurious.
}

// Class to represent a meal in the meal preparation app.
class Meal {
  // Constructor for creating a Meal instance.
  const Meal({
    required this.id, // A unique identifier for the meal.
    required this.categories, // List of categories the meal belongs to.
    required this.title, // The title or name of the meal.
    required this.imageUrl, // URL of the meal's image.
    required this.ingredients, // List of ingredients for the meal.
    required this.steps, // List of preparation steps for the meal.
    required this.duration, // Time required to prepare the meal.
    required this.complexity, // Complexity level of the meal (from the Complexity enum).
    required this.affordability, // Affordability of the meal (from the Affordability enum).
    required this.isGlutenFree, // Indicates whether the meal is gluten-free.
    required this.isLactoseFree, // Indicates whether the meal is lactose-free.
    required this.isVegan, // Indicates whether the meal is vegan.
    required this.isVegetarian, // Indicates whether the meal is vegetarian.
  });

  final String id; // Unique identifier for the meal.
  final List<String> categories; // Categories the meal belongs to.
  final String title; // Name or title of the meal.
  final String imageUrl; // URL of the meal's image.
  final List<String> ingredients; // List of ingredients for the meal.
  final List<String> steps; // List of preparation steps for the meal.
  final int duration; // Time required to prepare the meal (in minutes).
  final Complexity
      complexity; // Complexity level of the meal (from the Complexity enum).
  final Affordability
      affordability; // Affordability of the meal (from the Affordability enum).
  final bool isGlutenFree; // Indicates whether the meal is gluten-free.
  final bool isLactoseFree; // Indicates whether the meal is lactose-free.
  final bool isVegan; // Indicates whether the meal is vegan.
  final bool isVegetarian; // Indicates whether the meal is vegetarian.
}
