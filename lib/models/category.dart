import 'package:flutter/material.dart';

// Define a Category class to represent different meal categories.
class Category {
  // Constructor for creating a Category instance.
  const Category({
    required this.id, // A unique identifier for the category.
    required this.title, // The name or title of the category.
    this.color = Colors
        .orange, // The color associated with this category, defaults to orange.
  });

  final String id; // The unique identifier for the category.
  final String title; // The name or title of the category.
  final Color
      color; // The color associated with this category (defaults to orange).
}
