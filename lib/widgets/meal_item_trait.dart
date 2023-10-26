import 'package:flutter/material.dart';

// A widget that represents a trait (e.g., gluten-free, vegan) displayed in a meal item.
class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        size: 17,
        color: Colors.white, // Set the color of the icon to white.
      ),
      const SizedBox(width: 6), // Add spacing between the icon and the text.
      Text(
        label,
        style: const TextStyle(
          color: Colors.white, // Set the color of the text to white.
        ),
      ),
    ]);
  }
}
