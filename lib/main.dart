import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/tabs.dart';

// Define the app's theme using ThemeData and Google Fonts for text styling.
final theme = ThemeData(
  useMaterial3: true, // Enable Material 3 design.
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor:
        const Color.fromARGB(255, 131, 57, 0), // Define the primary color.
  ),
  textTheme: GoogleFonts.latoTextTheme(), // Apply Lato font to the text theme.
);

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme, // Apply the defined theme to the app.
      home: const TabsScreen(), // Set the initial screen to TabsScreen.
    );
  }
}
